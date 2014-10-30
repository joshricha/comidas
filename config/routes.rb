Rails.application.routes.draw do

  root 'recipes#index'

  get 'shopping_list' => 'shopping_list/index'

  get '/recipes/:id' => 'recipes#add'
  post '/recipes/:id' => 'recipes#add'

  resources :recipes, :plans, :shopping_lists
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

end
