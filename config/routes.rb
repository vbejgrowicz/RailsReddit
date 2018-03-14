Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :create, :new]

  resources :topics, only: [:index] do
    resources :posts
  end

  root 'posts#index'
end
