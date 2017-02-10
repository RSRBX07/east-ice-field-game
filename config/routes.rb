Rails.application.routes.draw do

  get 'ice_field/:id/melt', to: 'ice_field#melt'

  post 'ice_field/:id/roll', to: 'ice_field#roll', as: 'roll_ice_field_dice'

  get 'ice_field/:id/step', to: 'ice_field#step'

  get 'ice_field/:id', to: 'ice_field#show', as: 'ice_field_game'

  post 'ice_field/create'

  get 'ice_field/index', to: 'ice_field#index'

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
