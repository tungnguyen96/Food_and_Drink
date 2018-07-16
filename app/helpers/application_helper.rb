module ApplicationHelper
  # get user from sesssion by user_id inside session
  def current_user
    User.find_by id: session[:user_id]
  end
end
