Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:create, :new]

  resources :topics, only: [:show] do
    resources :posts, only: [:show, :create, :new, :edit, :update, :destroy]
  end

  root 'posts#index'
end
