Rails.application.routes.draw do
  get 'recommendations/pages'

  root to: 'cards#show'

  resources 'cards', only: [:show]

  get 'start', to: 'cards#home' #clears the cookies

  get 'swipe', to: 'cards#swipe'

  get 'out_of_cards', to: 'cards#out_of_cards'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'results', to: 'recommendations#show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
