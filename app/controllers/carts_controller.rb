class CartsController < ApplicationController
  before_action :check_login
  before_action :find_cart, only: [:update, :destroy]

  def show
    @cart = current_user.carts
    @total_price = Cart.total_price @cart
  end

  def create
    cart = current_user.carts.find_by product_id: params[:product_id]
    if cart.present?
      quantity = cart.quantity + params[:quantity].to_i
      cart.update_column :quantity, quantity
    else
      cart = current_user.carts.build cart_params
      cart.save
    end
    Product.update_quantity 0, params[:quantity].to_i, params[:product_id]
    redirect_to_back
  end

  def update
    return unless @cart
    Product.update_quantity @cart.quantity, params[:quantity].to_i,
      @cart.product.id
    @cart.update_column :quantity, params[:quantity].to_i
    flash[:success] = t ".notice"
    redirect_to cart_path current_user
  end

  def destroy
    return unless @cart
    if @cart.destroy
      Product.update_quantity @cart.quantity, 0, @cart.product.id
    else
      flash[:danger] = t ".notice"
    end
    redirect_to cart_path current_user
  end

  private

  def cart_params
    params.permit :quantity, :product_id
  end

  def find_cart
    @cart = current_user.carts.find_by id: params[:cart_id] || params[:id] 
  end
end