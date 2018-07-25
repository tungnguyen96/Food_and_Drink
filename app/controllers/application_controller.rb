class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  
  def check_login
    return if current_user.present?
    flash[:danger] = t :error1
    redirect_to root_path
  end

  def require_login
    return if logged_in?
    flash[:danger] = t :error1
    redirect_to new_account_session_path
  end

  def is_admin?
    return if current_user.admin? == false
    flash[:danger] = "You do NOT have permission!"
    redirect_to root_path
  end 
end
