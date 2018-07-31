class ApplicationController < ActionController::Base
  include SessionsHelper
  include CartsHelper
  before_action :search
  before_action :load_categories
  
  def check_login
    return if current_user.present?
    flash[:danger] = t :error1
    redirect_to root_path
  end

  def is_admin?
    return if current_user.admin? == false
    flash[:danger] = t :notpermis
    redirect_to root_path
  end

  def search  
    @q = Product.search(params[:q])
  end

  def load_categories
    @categories = Category.parent_category
  end
end
