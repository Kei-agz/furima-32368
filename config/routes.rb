Rails.application.routes.draw do
  #get ''
  resources :items, only: [:index, :new]
end
