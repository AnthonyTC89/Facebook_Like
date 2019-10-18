class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, 
        :email, :password, :password_confirmation, :gender, :birthday, :phone)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, 
      :email, :password, :gender, :birthday, :phone, :current_password, :password_confirmation)}
    end

    def after_sign_in_path_for(resource)
      '/users/show'
    end

    def after_sign_out_path_for(resource)
      root_path
    end
end
