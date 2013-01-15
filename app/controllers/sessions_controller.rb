class SessionsController < Devise::SessionsController
  def new
    super
    puts "Trying to login - create a new session on login"
  end


  def create
    super
    puts "Inside the Login POST - authenticate and make the session..."

    #@bowler = Bowler.find_all_by_username params[:username].downcase

    #resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    #
    #puts "Resource: #{resource}"

    #if is_navigational_format?
    #  if resource.sign_in_count == 1
    #    set_flash_message(:notice, :signed_in_first_time)
    #  else
    #    set_flash_message(:notice, :signed_in)
    #  end
    #end

    #puts "Attempting Sign In"
    #
    #sign_in(resource_name, resource)
    #respond_with resource, :location => after_sign_in_path_for(resource)
    #
    #puts "Finished Redirect in Login POST"
  end

  def destroy
    super
    puts "Attempting destroy of session."
  end
end
