Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      get '/forecast', to: 'forecast#show'

      # get '/register', to: 'users#new'
      # post '/users', to: 'users#create'

      # get '/login', to: 'sessions#new', as: login
      # post '/login', to: 'sessions#create'
      # post '/logout', to: 'sessions#destroy', as: logout
    end
  end
end
