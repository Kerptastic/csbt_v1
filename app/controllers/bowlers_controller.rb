class BowlersController < Devise::RegistrationsController

  def new
    super
    puts "Create a new Bowler HERE"
    #@bowler = Bowler.new
    #@contact = ContactInfo.new
  end


  def create
    puts "In the post registering a bowler"
    @bowler = Bowler.new(params[:bowler])

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

end
