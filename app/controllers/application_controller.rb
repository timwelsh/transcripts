class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do | exception |
   # if @scope_name != :admin_user
   #  if !current_user.blank?

   if current_user.subscription.blank?
    redirect_to plans_path
  else
    redirect_to edit_user_registration_path
  end
  
#   end
# end
end
def subregion_options
 render partial: 'subregion_select'
end
def after_sign_in_path_for(resource_or_scope)
  if scope_name == :admin_user
    admin_root_path
  else
    root_path
  end
end

protected
def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name,:email, :password, :password_confirmation, :remember_me,:zip,:phone) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password,:password_confirmation,:first_name ,:last_name ,:address1,:address2,:address3,:city,:state,:zip,:country, :phone, :status)}
end
end
