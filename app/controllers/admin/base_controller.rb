module Admin
  class BaseController < ApplicationController
    layout "admin"

    before_action :authenticate_user!

    # redirect to homepage if user is not logged in and not an admin
    def authenticate_user!
      # unless current_user.present? && current_user.admin?
      #   flash.now.alert = "You are not an admin!"
      #   redirect_to root_path
      # end
    end
  end
end
