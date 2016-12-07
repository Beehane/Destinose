Rails.application.routes.draw do
  get 'recommendations/pages'

  root to: 'cards#select'

  get 'next_card', to: 'cards#next_card'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'cards/show'

  get 'cards/select'

  get 'results', to: 'recommendations#show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
