Rails.application.routes.draw do

  root 'recipes#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get '/sign_up' => 'users#new'
  post '/sign_up' => 'users#create'

  # check if these are needed anymore
  get '/recipes/:id' => 'recipes#add'
  post '/recipes/:id' => 'recipes#add'

  resources :recipes, :users, :plans

end
