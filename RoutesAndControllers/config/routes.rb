Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end 


  resources :artworks, only: [:create, :destroy, :index, :show, :update] do 
      resources :comments, only: [:index]
  end 
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]

  #  get "/users/:id/artworks", to: "users#artworks" 
  # get "/users/:id", to: "users#show"
  # post "/users", to: "users#create"
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  # get "/users/new", to: "users#new"
  # get "/users/:id/edit", to: "users#edit"
  # put "/users/:id", to: "users#update"
end


# Comment.create!(body: "hype", artwork_id: 4, user_id: 2 )