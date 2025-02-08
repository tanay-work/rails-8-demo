Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  root "products#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :products do
    resources :subscribers, only: [ :create ]
    resource :unsubscribe, only: [ :show ]
  end
end
