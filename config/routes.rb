Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/invites', to: 'invites#show'
  get '/dashboard', to: 'dashboard#show', as: '/dashboard'
  # patch '/pool/:id', to: 'pool#update'
  root to: "homes#show"

  resources :sessions, only: [:create, :destroy]
  resource :homes, only: [:show]
  resources :search, only: [:index]
  resource :mate_preference, only: [:update]
  resource :trait, only: [:update]

  resources :conversations

  resources :daters, only: [:index, :show, :edit, :update, :destroy]
  resources :backers do
    resources :daters do
          resources :comments,  as: 'comments'
    end
  end
  resources :personalities, only: [:update]


  resources :users, only: [:edit, :show, :update, :destroy]
  post 'search', to: 'search#create' , as: "search"
  get 'daters/:id/pool', to: 'pool#index' , as: "user_pool"
  patch 'daters/:id/pool/:id', to: 'pool#update' , as: "edit_user_pool"


  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :daters, only: [:index, :show]
      namespace :daters do
        get "/:id/backers", to: "backers#index"
        get "/:id/backers/:backer_id", to: "backers#create"
      end

      resources :backers, only: [:index, :show]
      namespace :backers do
        get "/:id/daters", to: "daters#index"
      end
      get '/dater_backers/:id/personalities', to: "personalities#show"
      patch '/dater_backers/:id/personalities', to: "personalities#update"
      get '/pool', to: "pool#show"
    end
  end
end
