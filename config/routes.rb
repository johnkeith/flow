Rails.application.routes.draw do
  root 'application#index'

  namespace :api do
    post 'auth/create', to: 'authentication#create'
  end
end
