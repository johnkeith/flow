Rails.application.routes.draw do
  root 'application#index'
  
  namespace :api do
    post 'auth/create', to: 'authentication#create'

    namespace :v1 do
      resources :admins
      resources :graph
    end
  end
end
