Rails.application.routes.draw do
    namespace :v0 do
      namespace :item do
         resources :posts
    end
  end
  
  resources :users
  resources :comments, :except => :show
  resources :posts
  
  root 'posts#index'
  get '/newcomments', to: 'comments#index'
  get '/about', to: 'static_pages#about'
  get '/submit', to: 'posts#new'
  post '/signup',  to: 'users#create'
  get '/login', to: 'users#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
