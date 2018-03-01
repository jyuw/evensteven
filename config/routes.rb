Rails.application.routes.draw do
  get 'expenses/create'

  devise_for :users
  root controller: :welcome, action: :index
  get 'dashboard', to: 'welcome#dashboard'
  resources :groups, only: [:new, :create, :show] do
    resources :expenses, only: [:create]
  end

end
