Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'tracktimes#index'
  resources :tracktimes, except: [:show, :new]
end
