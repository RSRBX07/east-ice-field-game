Rails.application.routes.draw do


  get 'games/new', to: 'new#game', as: 'new_game'

  post 'games/create'

  resources :users
  get 'signup', to: "users#new"  # controller: :users, action: :new  
  get 'profile/:id', to: "users#show" #,  as: user
  post 'crop/:id', to: 'fruits#crop', as: 'crop_fruit'


  root 'games#index'

  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  post 'dice/:id', to: 'dice#roll', as: 'roll_dice'


  post 'crow/:id', to: 'crow#step', as: 'step_crow'

  post 'games/:id/win', to: 'games#win', as: 'game_win'

  post 'games/:id/loose', to: 'games#loose', as: 'game_loose'



  post 'crow/:id', to: 'crow#step', as: 'crow_step'

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
