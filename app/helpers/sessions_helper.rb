module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user? user
    user == current_user
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def check_admin user
    if user.admin?
      redirect_to admin_products_path
    else
      flash[:success] = t ".welcome"
      redirect_to root_path
    end
  end
end
