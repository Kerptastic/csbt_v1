class ApplicationController < ActionController::Base
    protect_from_forgery

    def after_sign_in_path_for(resource)
        "/profile/#{resource.last_name.downcase}.#{resource.first_name.downcase}"
    end

    def after_sign_up_path_for(resource)
        "/profile/#{resource.last_name.downcase}.#{resource.first_name.downcase}"
    end

    def after_inactive_sign_up_path_for(resource)
        #"/profile/#{resource.last_name}.#{resource.first_name}"
    end

    def set_current_bowler
        Bowler.current = current_bowler
    end
end
