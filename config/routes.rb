Rails.application.routes.draw do
  root 'messages#index'

  resources :messages, only: :index

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:create, :index]
    end
  end
end
