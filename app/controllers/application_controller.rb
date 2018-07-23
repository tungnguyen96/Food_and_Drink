class ApplicationController < ActionController::Base
  include SessionsHelper

  # def current_product
  #   @product = Product.find_by(id: params[:id])
  #   redirect_to root_path, alert: t(:no_product) unless @product
  # end

  def require_login
    return if logged_in?
    flash[:danger] = t :error1
    redirect_to new_account_session_path
  end
end
