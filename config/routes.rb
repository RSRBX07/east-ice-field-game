Rails.application.routes.draw do
<<<<<<< HEAD
  get 'games/index'

  get 'games/game'

=======
  get 'dice/roll'

  root 'games#index'
  
  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  post 'dice/:id', to: 'dice#roll', as: 'roll_dice'
>>>>>>> 7cad6582ead59a81b777bb1b020d807c671b50bb
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
