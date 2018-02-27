Rails.application.routes.draw do
  devise_for :users
  root controller: :welcome, action: :index
end
