module CartsHelper
  def redirect_to_back
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end
end
