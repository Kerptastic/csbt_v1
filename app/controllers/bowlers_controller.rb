class BowlersController < Devise::RegistrationsController
    def new
        super
    end


    def create
        @bowler              = Bowler.new(params[:bowler])
        @bowler.picture_url  = "../assets/#{@bowler.first_name.downcase}_#{@bowler.last_name.downcase}.jpg"
        @bowler.contact_info = ContactInfo.new(params[:contact_info])

        if @bowler.save
            if @bowler.active_for_authentication?
                set_flash_message :notice, :signed_up if is_navigational_format?
                sign_up(resource_name, @bowler)
                respond_with @bowler, :location => after_sign_up_path_for(@bowler)
            else
                set_flash_message :notice, :"signed_up_but_#{@bowler.inactive_message}" if is_navigational_format?
                expire_session_data_after_sign_in!
                respond_with @bowler, :location => after_inactive_sign_up_path_for(@bowler)
            end
        else
            clean_up_passwords @bowler
            respond_with @bowler
        end
    end

    def destroy
        super
    end

    def show
        @bowler = Bowler.where(:last_name => params[:lastname], :first_name => params[:firstname]).first
    end

    def edit
        @bowler = nil

        if !current_bowler.nil? && !current_bowler.id.nil?

          if current_bowler[:first_name].downcase == params[:firstname].downcase && current_bowler[:last_name].downcase == params[:lastname].downcase
            @bowler = current_bowler
          else
            redirect_to :action => 'badboy'
          end

        end
    end

    def update
      puts "In the update"

      Bowler.update_all(params[:bowler])

      redirect_to :action => 'show'
    end


    def badboy
      #log something here
    end

end
