Rails.application.routes.draw do

  root 'games#index'

  # game actions
  get 'games/new', to: 'new#game', as: 'new_game'
  post 'games/create'
  get 'games/show'
  get 'games/:id', to: 'games#show', as: 'game'

  # crow game player actions
  post 'dice/:id', to: 'games#roll', as: 'roll_dice'
  post 'games/:id/fruits/:fruit_id/crop', to: 'games#crop', as: 'crop_fruit'
  post 'crow/:id/step', to: 'games#step', as: 'step_crow'
  post 'games/:id/win', to: 'games#win', as: 'game_win'
  post 'games/:id/loose', to: 'games#loose', as: 'game_loose'

  resources :users
  get 'signup', to: "users#new"  # controller: :users, action: :new  
  get 'profile/:id', to: "users#show" #,  as: user





  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
