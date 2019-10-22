# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name,
               :email, :password, :password_confirmation, :gender, :birthday, :phone)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name,
               :email, :password, :gender, :birthday, :phone, :current_password, :password_confirmation)
    end
  end

  def after_sign_in_path_for(_resource)
    '/users/show'
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
