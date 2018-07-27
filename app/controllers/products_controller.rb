class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    @products = @q.result(distinct: true)
      .filter_product(params[:sort], params[:order])
      .page(params[:page]).per Settings.product.pagination
    return if @products.present?
    flash[:danger] = t ".noproduct"
    redirect_to_back
  end

  def show; end

  private

  def load_product
    @product = Product.find_by(id: params[:id])
    redirect_to root_path, alert: t(:no_product) unless @product
  end
end
