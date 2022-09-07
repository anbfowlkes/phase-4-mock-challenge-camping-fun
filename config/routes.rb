Rails.application.routes.draw do

  get '/campers', to: 'campers#index'

  get '/campers/:id', to: 'campers#show'

  post '/campers', to: 'campers#create'

  get '/activities', to: 'activities#index'
  delete 'activities/:id', to: 'activities#destroy'

  post '/signups', to: 'signups#create'

end
