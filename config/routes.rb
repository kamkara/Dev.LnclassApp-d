Rails.application.routes.draw do
  
  root to:'welcome#index'
  get "course-list", to:"courses#index"
  get "lesson", to:"courses#new"
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "dashboard-admin", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  get "feeds", to:'home#index'
  
  resources :courses do
    resources :exercices, only: [:new, :create, :show, :index]
    get "exercices", to:"exercices#index"
    post '/publish', to: 'exercices#publish'
  end

  resources :exercices, except: [:new, :show, :edit, :create, :update, :destroy, :index] do
    member do
      delete 'delete', to: 'exercices#destroy'
    end
    resources :questions, only: [:new, :create, :destroy]
    #resources :results, only: [:new, :create]
  end
  
  resources :courses, except: %i[index new]
  resources :answers
  resources :questions  
  resources :materials, execept: %i[new]
  resources :levels, execept: %i[new]
  resources :results
  
  devise_for :users, path: '', path_names: { sign_in: 'Connecter', 
              sign_out: 'logout', password: 'secret', confirmation: 'verification',
              unlock: 'unblock', registration: '', sign_up: 'inscription-eleves' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
