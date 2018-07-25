class OrdersController < ApplicationController
  before_action :check_login

  def show
    @order = current_user.orders.order created_at: :desc
  end

  def create
    @order = Order.new purchased: true, user: current_user
    @order.save
    carts = current_user.carts
    $i = 0
    $j = carts.count
    carts.each do |c|
      unless c.product.present?
        $i += 1
        next
      end
      if c.product.quantity == 0
        $i += 1
        next
      elsif c.product.quantity < c.quantity
        cart_quantity = c.product.quantity
      else
        cart_quantity = c.quantity
      end
      total_price = cart_quantity * c.product.price
      ProductOrder.create!(quantity: cart_quantity,
        total_price: total_price,
        order: @order,
        product: c.product)
      product_quantity = c.product.quantity - cart_quantity
      c.product.update_column :quantity, product_quantity
      c.destroy
    end
    if $i == $j
      flash[:danger] = t ".danger"
      @order.destroy
    else
      flash[:success] = t ".purchased"
    end
      redirect_to cart_path(current_user)
  end
end
