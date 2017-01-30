Rails.application.routes.draw do
  get 'dice/roll'

  root 'games#index'
  
  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  post 'dice/:id', to: 'dice#roll', as: 'roll_dice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
