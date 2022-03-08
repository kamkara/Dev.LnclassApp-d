Rails.application.routes.draw do
  
  
  root to:'welcome#index'
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "dashboard-admin", to:'dashboard#index'
  get "dashboard-teacher", to:'dashboard#home'
  get "feeds", to:'home#index'
  resources :materials, execept: %i[new]
  resources :levels, execept: %i[new]
  
  devise_for :users, path: '', path_names: { sign_in: 'Connecter', 
              sign_out: 'logout', password: 'secret', confirmation: 'verification',
              unlock: 'unblock', registration: '', sign_up: 'inscription-eleves' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
