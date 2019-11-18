Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :d3_crawler, only: %i[index]
  resources :d3_logic, only: %i[index]

  get 'd3_crawler', to: 'd3_crawler#result'




end
