Rails.application.routes.draw do
  root 'application#index'
  
  namespace :api do
    post 'auth/create', to: 'authentication#create'

    namespace :v1 do
      resources :graph
    end
  end

  get "*path", to: "application#index"
end
