Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      get '/forecast', to: 'forecasts#show'
      get '/background', to: 'backgrounds#show'

      post '/users', to: 'users#create'

      post '/sessions', to: 'sessions#create'
      # post '/login', to: 'sessions#create'
      # post '/logout', to: 'sessions#destroy', as: logout
    end
  end
end
