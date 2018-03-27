Rails.application.routes.draw do
  devise_for :users
  root 'places#index' 

  resources :places do 
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #ustvarjeni routi
  get '/index' => 'places#index'
  get '/show' => 'places#show'
end
