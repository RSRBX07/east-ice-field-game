Rails.application.routes.draw do
  get 'crow/move'

  get 'dice/roll'

  root 'games#index'
  
  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  post 'dice/:id', to: 'dice#roll', as: 'roll_dice'
  post 'crow/:id', to: 'crow#move', as: 'crow_move_to'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
