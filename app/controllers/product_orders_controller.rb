class ProductOrdersController < ApplicationController
  before_action :check_login
  
  def show
    @order = Order.find_by id: params[:id]
    @product_orders = @order.product_orders
    @total_price = Cart.total_price @product_orders
  end
end
