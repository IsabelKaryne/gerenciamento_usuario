# config/initializers/authentication.rb
BASIC_AUTH_TOKEN = ENV["BASIC_AUTH_TOKEN"]

module Authentication
  def authenticate_basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(password, BASIC_AUTH_TOKEN)
    end
  end
end
