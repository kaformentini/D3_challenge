Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  # resources :d3_crawler, only: %i[index new create]
  # resources :links, only: %i[new create]
    # get 'link', on: :member
  

  resources :d3_logic, only: %i[index]

  get 'd3_crawler', to: 'd3_crawler#result'
  get 'd3_crawler/link', to: 'd3_crawler#link'
  get 'contato', to: 'contact#index'

  post 'd3_crawler/link', to: 'd3_crawler#result'
 



end
