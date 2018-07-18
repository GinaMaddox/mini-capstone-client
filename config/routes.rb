Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get '/' => 'client/products#index'
  namespace :client do
   get '/products' => 'products#index'
   get '/products/new' => 'products#new'
   post '/products' => 'products#create'
   get '/products/:id' => 'products#show'
   get '/products/:id/edit' => 'products#edit'
   patch '/products/:id' => 'products#update'
   delete '/products/:id' => 'products#destroy'
   
   #user signup/login/logout routes
   get "/signup" => "users#new"
   post "/users" => "users#create"
   get "/login" => "sessions#new"
   post "/login" => "sessions#create"
   delete "/logout" => "sessions#destroy"

  
  post '/orders' => 'orders#create'
  get '/orders/new' => 'orders#new'
  get '/orders/:id' => 'orders#show'
  end
end
