# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Criação de usuários com diferentes status (ativos e inativo)

# Vamos garantir que qualquer usuário existente com os mesmos critérios seja excluído para evitar duplicações

# Criação do primeiro usuário ativo
User.create!(
  nome: "Admin User",
  data_de_nascimento: "1990-01-01",
  email: "admin@exemplo.com",
  cpf: "12345678901",
  password: "admin123",  # Aqui deve ser 'password'
  status: 0,  # Ativo
  permissao: 0  # Admin
)

# Criação do segundo usuário ativo
user2 = User.create!(
  nome: "Usuário Ativo 2",
  data_de_nascimento: "1992-06-21",
  email: "usuario2@exemplo.com",
  cpf: "98765432100",
  password: "senha456",  # Senha pode ser qualquer valor seguro, altere conforme necessário
  status: 0,          # Status ativo (0)
  permissao: 1        # Permissão comum (1)
)

# Criação do usuário inativo
user3 = User.create!(
  nome: "Usuário Inativo",
  data_de_nascimento: "2000-12-05",
  email: "usuario3@exemplo.com",
  cpf: "11223344556",
  password: "senha789",  # Senha pode ser qualquer valor seguro, altere conforme necessário
  status: 1,          # Status inativo (1)
  permissao: 1        # Permissão comum (1)
)

puts "Três usuários foram criados com sucesso: dois ativos e um inativo!"
