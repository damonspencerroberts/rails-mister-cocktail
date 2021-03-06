Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :cocktails do
    collection do
      get 'search', to: 'cocktails#pour'
    end

    member do
      resources :doses, only: %i[new create]
      resources :reviews, only: %i[new create]
    end
  end
  delete 'doses/:id', to: 'doses#delete', as: 'delete_doses'
end
