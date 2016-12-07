Rails.application.routes.draw do
  get 'recommendations/pages'

  root to: 'cards#show'

  resources 'cards', only: [:show]

  get 'start', to: 'cards#home' #clears the cookies

  get 'swipe', to: 'cards#swipe'

  get 'dashboard', to: 'pages#dashboard'

  get 'results', to: 'recommendations#show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
