Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index, :show, :update]
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    member do 
      get 'favorites'
    end
    resources :artwork_shares, only: [:update]
    resources :collections, only: [:index, :update]
  end 

  resources :collections, only: [:create, :destroy, :update, :show, :index]
  resources :artworks, only: [:create, :destroy, :index, :show, :update] do 
      resources :comments, only: [:index]
      resources :likes, only: [:index]
  end 
  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :index, :destroy]
  resources :comments, only: [:index, :create, :destroy] do
      resources :likes, only: [:index]
  end 

  

    # get "/users/:id/favorites/", to: "users#view_favorites" 
    # patch "/users/:id/favorites", to: "users#edit_favorites"
    # post "users/:id/"
  # get "/users/:id", to: "users#show"
  # post "/users", to: "users#create"
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  # get "/users/new", to: "users#new"
  # get "/users/:id/edit", to: "users#edit"
  # put "/users/:id", to: "users#update"
end


# Comment.create!(body: "hype", artwork_id: 4, user_id: 2 )