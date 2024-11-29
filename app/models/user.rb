# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  enum status: { ativo: 0, inativo: 1 }
  enum permissao: { admin: 0, comum: 1 }

  validates :nome, :email, :cpf, :senha, presence: true
  validates :email, uniqueness: true
  validates :cpf, uniqueness: true
end
