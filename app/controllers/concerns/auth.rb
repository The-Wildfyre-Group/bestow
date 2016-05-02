module Auth
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find_by_authentication_token(cookies[:authentication_token]) if cookies[:authentication_token]
  end

  def login(user)
    cookies.permanent[:authentication_token] = user.authentication_token
  end

  def logout
    cookies.delete(:authentication_token)
  end
end