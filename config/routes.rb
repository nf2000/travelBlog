Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home  

  root 'home#index'
  get 'post' => 'home#new'
  post "post" => "home#create"
  get '/home/:id' => 'home#show', as: :blog
 
end
