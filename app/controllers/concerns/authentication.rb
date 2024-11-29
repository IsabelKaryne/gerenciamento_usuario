# app/controllers/concerns/authentication.rb
module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authorize_basic_auth, only: [ :create, :update_status ]
  end

  private

  # Verifica o Basic Auth para ações protegidas
  def authorize_basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
