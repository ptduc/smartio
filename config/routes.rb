Rails.application.routes.draw do
  resources :message_logs
  resources :devices
  resources :units
  get 'control', to: 'control#index'
  get 'home/index'
  resources :tasks
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
