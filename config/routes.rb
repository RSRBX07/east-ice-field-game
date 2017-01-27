Rails.application.routes.draw do
root 'games#index'
  
  get 'games/show'

  get 'games/:id', to: 'games#show', as: 'game'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
