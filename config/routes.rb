Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:create, :new, :destroy]

  resources :topics, only: [:show] do
    resources :posts, only: [:index, :show, :create, :new, :edit, :update]
  end

  root 'posts#index'
end
