# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: "Permissão negada" }, status: :forbidden
  end

  def current_user
    token = request.headers["Authorization"]&.split(" ")&.last
    if token
      user_id = JWT.decode(token, Rails.application.secret_key_base)[0]["user_id"]
      @current_user ||= User.find(user_id)
    end
  rescue JWT::DecodeError
    nil
  end

  def authenticate_user!
    token = request.headers["Authorization"]&.split(" ")&.last

    if token
      user_id = JWT.decode(token, Rails.application.secret_key_base)[0]["user_id"]
      @current_user ||= User.find(user_id)
    else
      render json: { error: "Token não fornecido" }, status: :unauthorized
    end
  end

  def authenticate_basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(password, ENV["BASIC_AUTH_TOKEN"])
    end
  end
end
