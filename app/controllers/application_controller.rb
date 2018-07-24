class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  
  def check_login
    return if current_user.present?
    flash[:danger] = t :error1
    redirect_to root_path
  end
end
