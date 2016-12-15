Rails.application.routes.draw do
  get 'users/facebook'

  root to: 'pages#landing'

  resources 'cards', only: [:show]

  get 'save_result', to: 'recommendations#save_to_recommendation'

  get 'swipe', to: 'cards#swipe'

  get 'next_card', to: 'cards#next_card'

  get 'restart', to: 'cards#restart'

  get 'dashboard', to: 'pages#dashboard'

  get 'regular_result', to: 'recommendations#regular_result'

  get 'need_more_info', to: 'pages#need_more_info'

  get 'results', to: 'recommendations#show', as: 'results'

  get '/results/:id', to: 'recommendations#existing', as: 'existing'

  delete '/results/:id', to: 'recommendations#destroy', as: 'destroy'

  get 'search', to: 'pages#search'

  get '/improve/:id', to: 'recommendations#improve', as: 'improve'

  get 'out_of_cards', to: 'pages#out_of_cards'

  get '/landing', to: 'pages#landing'

  get 'itinerary', to: 'recommendations#itinerary'

  get 'landing', to: 'pages#landing'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
