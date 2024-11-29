Rails.application.routes.draw do
  # Rota para login (criação de sessão)
  post "/login", to: "sessions#create"

  # Rota para logout (destruição da sessão)
  delete "/logout", to: "sessions#destroy"

  # Rota para o gerenciamento de usuários
  resources :users, only: [ :index, :create, :show, :update, :destroy ] do
    # Rota para alterar o status de um usuário
    patch "update_status", on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
