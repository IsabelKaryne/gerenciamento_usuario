# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:senha]) && user.ativo?
      token = encode_token({ user_id: user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: "Credenciais inválidas ou usuário inativo" }, status: :unauthorized
    end
  end

  def destroy
    render json: { message: "Logout realizado com sucesso" }, status: :ok
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
