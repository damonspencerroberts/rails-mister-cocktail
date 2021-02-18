Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index create new show] do
    member do
      resources :doses, only: %i[new create]
    end
  end
  delete 'doses/:id', to: 'doses#delete', as: 'delete_doses'
end
