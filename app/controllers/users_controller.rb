class UsersController < Devise::RegistrationsController
    #
    def new
        super
    end

    #
    def create
        #create the new user with the params sent in the request
        @user = User.new(params[:user])

        #check to see if this bowler is already in the DB from tourney entries
        @bowler = Bowler.where(:last_name => params[:bowler][:last_name], :first_name => params[:bowler][:first_name]).first

        #if the bowler is found - auto link them to the account, if not, create a new bowler
        if @bowler.nil?
            @user.bowler = Bowler.new(params[:bowler])
        else
            @user.bowler = @bowler
        end

        @count = User.includes(:bowler).where('Bowlers.first_name = ? AND Bowlers.last_name = ?', @user.bowler.first_name, @user.bowler.last_name).count

        @user.bowler.picture_url  = "../assets/#{@user.bowler.first_name.downcase}_#{@user.bowler.last_name.downcase}_#{@count + 1}.jpg"
        @user.bowler.contact_info = ContactInfo.new(params[:contact_info])

        if @user.save
            if @user.active_for_authentication?
                set_flash_message :notice, :signed_up if is_navigational_format?
                sign_up(resource_name, @user)
                respond_with @user, :location => after_sign_up_path_for(@user)
            else
                set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
                expire_session_data_after_sign_in!
                respond_with @user, :location => after_inactive_sign_up_path_for(@user)
            end
        else
            clean_up_passwords @user
            respond_with @user
        end
    end

    #
    def destroy
        super
    end

    #
    def badboy
        #log something here
    end

end
