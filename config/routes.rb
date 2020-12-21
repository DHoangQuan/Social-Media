Rails.application.routes.draw do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get 'posts/index'
    post 'comments/create'
    post 'posts/create'
    root 'posts#index'  
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
    get "logout", to: "sessions#destroy", as: "logout"
    resources :sessions, only: [:new, :create, :destroy]  
    resources :posts 
    resources :comments
    resources :users
    resources :media do
      member do
        get 'next', to: 'media#next_medium'
        get 'previous', to: 'media#prev_medium'
      end
      # collection do
      #   delete 'multiple_delete', to: 'media#multiple_delete'
      # end
    end
    mount ActionCable.server => '/cable'
end
