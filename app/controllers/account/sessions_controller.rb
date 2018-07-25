module Account
  class SessionsController < ApplicationController
    def new; end

    def create
      user = User.find_by email: params[:session][:email].downcase
      if user&.authenticate(params[:session][:password])
        log_in user
        check_admin user
      else
        flash.now[:danger] = t ".error"
        render :new
      end
    end

    def destroy
      log_out
      redirect_to root_url
    end
  end
end
