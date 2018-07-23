class RatingsController < ApplicationController
  before_action :require_login
  before_action :load_product

  def create
    @rate = @product.ratings.build rating_params.merge user: current_user

    if @rate.save
      flash.alert = t :rate_success
    else
      flash.alert = t :rate_fail
    end

    redirect_to @product
  end

  private

  def ratings_of_current_product
    @product.ratings
  end

  def load_product
    @product ||= Product.find_by(id: params[:rating][:product_id])
    redirect_to root_path, alert: t(:no_product) unless @product
  end

  def rating_params
    params.require(:rating).permit :value
  end
end
