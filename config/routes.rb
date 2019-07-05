Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'page/show'
  get 'home/show'
  
  resources :page, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#show'

end
