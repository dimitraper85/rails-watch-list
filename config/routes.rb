Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'lists/index'
  get 'lists/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end

# A user can add a new bookmark (movie/list pair) to an existing list
# Checkout simple_form docs about f.association to easily create a select dropdown for our list of movies.
# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"
# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"

# As a user, I can see all my movie lists - index ✅
# As a user, I can create a movie list - show ✅
# As a user, I can see the details of a movie list -new and create ✅
# As a user, I can bookmark a movie inside a movie list -new and create (nested in lists) ✅
# As a user, I can destroy a bookmark - destroy
