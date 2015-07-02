class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # def subregion_options
  # 	render partial: 'subregion_select'
  # end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password,:first_name ,:last_name ,:address1,:address2,:address3,:city,:state,:zip,:country, :phone, :status)}
  end
end
