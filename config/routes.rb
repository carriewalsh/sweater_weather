Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      get '/forecast', to: 'forecasts#show'
      get '/backgrounds', to: 'backgrounds#show'

      get '/antipode', to: 'antipodes#show'

      post '/users', to: 'users#create'

      post '/sessions', to: 'sessions#create'

      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#show'
      delete '/favorites', to: 'favorites#destroy'
    end
  end
end
