Rails.application.routes.draw do
  devise_for :users
  root controller: :welcome, action: :index
  get 'dashboard', to: 'welcome#dashboard'
  resources :group, only: [:new, :create, :show]
end
