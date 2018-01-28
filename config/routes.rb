Rails.application.routes.draw do
  root 'application#index'

  namespace :api do
    namespace :v1 do
      get 'test', to: 'application#test'
    end
  end
end
