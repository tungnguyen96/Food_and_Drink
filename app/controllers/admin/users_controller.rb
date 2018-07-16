module Admin
  class UsersController < BaseController
    def index
      @user = User.all
    end

    # redirect to users list after delete user by user_id in params
    def destroy
      if load_user.present?
        load_user.destroy
        redirect_to admin_users_path
      else
        flash.now.alert = t :user
        redirect_to :back
      end
    end

    # get user by user_id in param
    def load_user
      @user = User.find(params[:id])
    end
  end
end
