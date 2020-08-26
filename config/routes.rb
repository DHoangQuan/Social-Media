Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/index'
  post 'comments/create'
  post 'posts/create'
  root 'posts#index'  
  resources :posts 
  resources :comments
  resources :media do
    member do
      get 'next', to: 'media#next_medium'
      get 'previous', to: 'media#prev_medium'
    end
    # collection do
    #   delete 'multiple_delete', to: 'media#multiple_delete'
    # end
  end
  
end
