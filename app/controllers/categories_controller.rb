class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @categories = Category.where(parent_id: nil)
  end
  
  def show
    ids = @category.child_ids.dup << @category.id
    @products = Product.where(category_id: ids)
  end

  private

  def load_category
    @category = Category.find_by(id: params[:id])
    redirect_to root_path, alert: t(:not_found) unless @category
  end
end 
