class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  before_action :search
  
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
    flash[:danger] = t :notpermis
    redirect_to root_path
  end

  def search
    @q = Product.search(params[:q])
  end
end
