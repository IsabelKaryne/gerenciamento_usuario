# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_basic_auth, only: [ :update_status ]
  before_action :authorize_user, only: [ :update ]

  def index
    # Permissão baseada em CanCanCan
    authorize! :read, User
    users = current_user.admin? ? User.all : [ current_user ]
    render json: users
  end

  def update
    # Verifica se o usuário tem permissão para atualizar seu perfil
    authorize! :update, @user

    if @user.update(user_params)
      render json: @user
    else
      render json: { error: "Não foi possível atualizar o perfil" }, status: :unprocessable_entity
    end
  end

  def update_status
    user = User.find(params[:id])
    authorize! :update_status, user

    if user.update(status: params[:status])
      render json: { message: "Status atualizado com sucesso" }
    else
      render json: { error: "Erro ao atualizar o status" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email, :cpf, :senha, :data_de_nascimento)
  end

  def authorize_user
    @user = User.find(params[:id])
    authorize! :update, @user
  end
end
