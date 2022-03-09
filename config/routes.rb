Rails.application.routes.draw do
  resources :exercices
  
  
  root to:'welcome#index'
  get "course-list", to:"courses#index"
  get "lesson", to:"courses#new"
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "dashboard-admin", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  get "feeds", to:'home#index'

  resources :courses, except: %i[index new]
  resources :materials, execept: %i[new]
  resources :levels, execept: %i[new]
  
  devise_for :users, path: '', path_names: { sign_in: 'Connecter', 
              sign_out: 'logout', password: 'secret', confirmation: 'verification',
              unlock: 'unblock', registration: '', sign_up: 'inscription-eleves' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
