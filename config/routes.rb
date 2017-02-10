Rails.application.routes.draw do

  get 'ice_field/melt'

  get 'ice_field/roll'

  get 'ice_field/step'

  get 'ice_field/show'

  get 'ice_field/create'

  root 'games#index'

  # game actions
  get 'games/new', to: 'new#game', as: 'new_game'
  post 'games/create'
  get 'games/show'
  get 'games/:id', to: 'games#show', as: 'game'

  # crow game player actions
  post 'dice/:id', to: 'games#roll', as: 'roll_dice'
  get 'games/:id/fruits/:fruit_id/crop', to: 'games#crop', as: 'crop_fruit'
  post 'crow/:id/step', to: 'games#step', as: 'step_crow'
  get 'games/:id/win', to: 'games#win', as: 'game_win'
  get 'games/:id/loose', to: 'games#loose', as: 'game_loose'

  resources :users
  get 'signup', to: "users#new"  # controller: :users, action: :new  
  get 'profile/:id', to: "users#show" #,  as: user





  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
