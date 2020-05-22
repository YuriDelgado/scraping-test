Rails.application.routes.draw do
  root "judgements#index"
  resources :judgements, except: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
