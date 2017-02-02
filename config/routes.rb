Rails.application.routes.draw do

  resources :users
  get 'signup', to: "users#new"  # controller: :users, action: :new  
  get 'profile/:id', to: "users#show" #,  as: user
  post 'crop/:id', to: 'fruits#crop', as: 'crop_fruit'

  root 'games#index'

  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  post 'dice/:id', to: 'dice#roll', as: 'roll_dice'

  post 'crow/:id', to: 'crow#step', as: 'crow_step'

  post 'games/:id/win', to: 'games#win', as: 'game_win'
  
  post 'games/:id/loose', to: 'games#loose', as: 'game_loose'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
