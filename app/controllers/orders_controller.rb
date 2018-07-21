class OrdersController < ApplicationController
  def create
    @order = Order.new purchased: true, user: current_user
    @order.save
    flash[:success] = t ".purchased"
    redirect_to cart_path(current_user)
    cart = current_user.carts
    cart.each do |c|
      quantity = c.quantity
      total_price = quantity * c.product.price
      ProductOrder.create!(quantity: quantity,
        total_price: total_price,
        order: @order,
        product: c.product)
    end
    cart.delete_all
  end
end
