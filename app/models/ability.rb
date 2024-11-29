# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, User          # Admin pode gerenciar todos os usuários
    else
      can :read, User, id: user.id  # Usuário comum pode ler apenas seu próprio perfil
      can :update, User, id: user.id  # Usuário comum pode atualizar apenas seu próprio perfil
    end

    cannot :update_status, User if user.comum?  # Usuário comum não pode alterar status
  end
end
