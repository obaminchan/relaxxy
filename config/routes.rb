Rails.application.routes.draw do

  get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'    #トップページのルーティングを指定  #acction
  get 'pages/help'      #URL

  resources :posts
  resources :comments
end
