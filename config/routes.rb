Rails.application.routes.draw do
  get 'expenses/create'

  devise_for :users, controllers: { omniauth_callbacks: :omniauth_callbacks }
  root controller: :welcome, action: :index
  get 'dashboard', to: 'welcome#dashboard'
  resources :groups, only: [:new, :create, :show] do
    resources :expenses, only: [:create]
  end

end
