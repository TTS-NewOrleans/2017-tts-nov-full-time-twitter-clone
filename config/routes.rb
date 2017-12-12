Rails.application.routes.draw do
  get 'profiles' => 'profiles#index'
  get 'profiles/:id' => 'profiles#show', as: :profile

  resources :tweets do
    resource :likes
  end
  resources :relationships, only: [:create, :destroy]

  devise_for :users

  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
