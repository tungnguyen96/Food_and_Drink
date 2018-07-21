class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
      .per(Settings.product.pagination)
  end
end
