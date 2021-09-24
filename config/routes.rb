Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home, :post

  root 'home#index'
  get '/home/new' => 'home#new'
 
end
