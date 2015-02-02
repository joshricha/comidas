Rails.application.routes.draw do

  root 'recipes#index'

  get 'shopping_list' => 'shopping_list/index'

  # don't need both of these. Test
  get '/recipes/:id' => 'recipes#add'
  post '/recipes/:id' => 'recipes#add'

  resources :recipes, :plans, :shopping_lists
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

end
