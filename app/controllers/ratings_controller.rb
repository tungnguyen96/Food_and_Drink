class RatingsController < ApplicationController
  before_action :current_product
  before_action :require_login

  def create
    # @rate = Rate.new value: params[:value]
    #   content: params[:content],
    #   user_id: current_user.id,
    #   product_id: current_product.id

    # total_rate = ratings_of_current_product.sum(&:value) + params[:value]
    # rate_count = ratings_of_current_product.count

    # current_product.update rate_average: total_rate / rate_count

    # current_product.rate(value: params[:value])
    # render "products/show"
  end

  private

  def ratings_of_current_product
    current_product.rattings
  end
end
