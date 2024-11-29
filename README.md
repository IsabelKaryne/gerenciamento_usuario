# README

# Sistema de Gerenciamento de Usuários

Este é um sistema de gerenciamento de usuários com autenticação, controle de permissões e gerenciamento de status. A API utiliza PostgreSQL como banco de dados e fornece funcionalidades de login, logout e controle de acesso para usuários com diferentes permissões.

## Tecnologias

- Ruby on Rails
- PostgreSQL
- JWT (JSON Web Token) para autenticação
- CanCanCan para controle de permissões
- Basic Auth para ações críticas

## Funcionalidades

### 1. Autenticação
- **Login**: Usuários podem fazer login utilizando email e senha. O sistema retorna um JWT que deve ser utilizado para autenticação em ações subsequentes.
- **Logout**: Revoga o JWT, invalidando o acesso à API.
- **Basic Auth**: Usado para ações críticas, como a criação de usuários e alteração do status de usuários.

### 2. Controle de Permissões
- **CanCanCan**: Usado para gerenciar permissões de acesso a diferentes recursos.
  
### 3. Tipos de Usuários
- **Admin**:
  - Pode gerenciar todos os usuários.
  - Pode alterar o status de qualquer usuário (ativar ou desativar).
  
- **Comum**:
  - Pode visualizar e editar apenas seu próprio perfil.

### 4. Gerenciamento de Usuários
- **Cadastro de Usuários**: Usuários podem ser criados pela API, com senha gerada automaticamente e notificação enviada por email.
- **Alteração de Status**: Administradores podem alterar o status dos usuários (ativo ou inativo).
- **Edição de Perfil**: Usuários podem editar suas próprias informações, enquanto administradores podem editar qualquer perfil.

## Configuração

### Pré-requisitos

- Ruby 3.x
- Rails 7.x
- PostgreSQL

### Passos para rodar o projeto

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu_usuario/sistema-de-usuarios.git
   cd sistema-de-usuarios

2. Instale as dependências:
bundle install

3. Configure o banco de dados:

Crie o arquivo de variáveis de ambiente .env com as credenciais do banco de dados:

Depois, execute as migrations para configurar o banco de dados:

bash
Copy code

4. Inicie o servidor:
rails server

Provavelmente estará disponível em http://localhost:3000.

5. Endpoints da API
    1. Cadastro de Usuário
POST /api/users – Cria um novo usuário.
    2. Login
POST /api/login – Realiza o login de um usuário e retorna um token JWT.
    3. Logout
POST /api/logout – Realiza o logout e invalida o token JWT.
    4. Visualização e Edição de Perfil
GET /api/profile – Exibe o perfil do usuário logado.
PUT /api/profile – Edita as informações do perfil do usuário logado.
    5. Gerenciamento de Usuários (Admin)
GET /api/users – Lista todos os usuários (apenas para admin).
GET /api/users/:id – Exibe as informações de um usuário (apenas para admin).
PUT /api/users/:id – Atualiza as informações de um usuário (apenas para admin).
PUT /api/users/:id/status – Altera o status (ativo/inativo) de um usuário (apenas para admin).
Controle de Permissões
A API utiliza a gem CanCanCan para controle de permissões, garantindo que apenas usuários com permissões adequadas possam acessar ou modificar certos recursos. As permissões são definidas no arquivo app/models/ability.rb.

Segurança
JWT: Utilizamos JWT para autenticação de usuários. O token é gerado durante o login e deve ser enviado em todas as requisições subsequentes.
Basic Auth: Utilizado para ações críticas como a criação de usuários e alteração de status. O token de autenticação é enviado via cabeçalho de autorização.