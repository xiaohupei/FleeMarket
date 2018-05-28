Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'search/:keyword', to: 'items#search'
      post '/login', to: "login#login"
      get '/users/:id', to: 'users#show'
      resource :profile, only: [:show, :update]
      resources :detail_images, only: [:create, :destroy]
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :connections, only: [:show, :create, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
