class ApplicationController < ActionController::Base
    protect_from_forgery

    def after_sign_in_path_for(resource)
        "/bowler/#{resource.bowler.last_name.downcase}.#{resource.bowler.first_name.downcase}"
    end

    def after_sign_up_path_for(resource)
        "/bowler/#{resource.bowler.last_name.downcase}.#{resource.bowler.first_name.downcase}"
    end

    def after_inactive_sign_up_path_for(resource)
        #"/bowler/#{resource.bowler.last_name}.#{resource.bowler.first_name}"
    end

    def set_current_user
        User.current = current_user
    end
end
