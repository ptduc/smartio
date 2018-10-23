Rails.application.routes.draw do
  devise_for :users
  resources :dota
  resources :commands
  resources :message_logs
  resources :devices
  resources :units
  get 'control', to: 'control#index'
  get 'home/index'
  root 'home#index'
  resources :control do
    collection do
      get :get_device
       get 'get_device/:id', to: 'control#get_device'
       post :create_command
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
