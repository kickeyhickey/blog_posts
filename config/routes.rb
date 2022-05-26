Rails.application.routes.draw do
  resources :posts
  get 'posts/:id' => 'posts#show'
  post 'posts' => 'posts#create'
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy'
  root 'posts#index'
end
