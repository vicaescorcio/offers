class ApplicationController < ActionController::Base
  protected

  def authenticate_admin_user!
    try_authenticate_admin || request_authenticate_admin
  end

  def try_authenticate_admin
    authenticate_with_http_basic do |username, password|
      admin_user = AdminUser.find_by_username(username)
      admin_user&.authenticate(password)
    end
  end

  def request_authenticate_admin
    request_http_basic_authentication
  end
end
