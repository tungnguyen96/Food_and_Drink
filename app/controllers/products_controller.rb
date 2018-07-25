class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @products = Product.where("quantity > 0")
      .filter_product(params[:sort], params[:order])
      .page(params[:page]).per Settings.product.pagination
  end

  def show; end

  private

  def load_product
    @product = Product.find_by(id: params[:id])
    redirect_to root_path, alert: t(:no_product) unless @product
  end
end
