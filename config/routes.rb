Rails.application.routes.draw do
  root to: 'cards#select'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'cards/show'

  get 'cards/select'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
