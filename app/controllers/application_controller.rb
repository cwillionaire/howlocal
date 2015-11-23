class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
  before_filter :authenticate_user!
=======
  before_action :authenticate_user!
>>>>>>> d8bea476de8ee489e970017b70f61ab679fbc123
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters

   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, 
     :name, :username, :location, :admin, :busi_own) }

   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, 
     :current_password, :name, :username, :location, :admin, :busi_own) }

 end

end
