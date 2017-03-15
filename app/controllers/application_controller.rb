class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

 # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #rescue_from ActiveRecord::RecordNotFound, with: :recordNotFound 
  def user_not_authorized
    flash[:alert] =  "禁止: 非管理員或本人不可執行此動作"
    redirect_to("../")
  end
=begin
  def recordNotFound
    flash[:alert] = "錯誤操作"
    redirect_to("../")
  end
=end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :nick_name, 
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:first_name, :last_name, :nick_name, 
        :email, :password, :password_confirmation, :current_password)
    end
  end

  
end
