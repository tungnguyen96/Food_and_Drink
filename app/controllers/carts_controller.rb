class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :check_login
  before_action :is_admin?
  before_action :find_cart, only: [:update, :destroy]

  def show
    @carts = current_user.carts
    @total_price = Cart.total_price @carts
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
    redirect_to cart_path current_user
  end

  def update
    @cart&.update_attributes quantity: params[:quantity]
  end

  def destroy
    return unless @cart
    if @cart.destroy
      flash[:success] = t ".noticedel"
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
    @cart = current_user.carts.find_by id: params[:id]
  end
end
