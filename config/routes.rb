Rails.application.routes.draw do
  root to:'welcome#index'
  get "feeds", to:'home#index'
  
  devise_for :users, path: '', path_names: { sign_in: 'Connecter', 
                sign_out: 'logout', password: 'secret', confirmation: 'verification',
                 unlock: 'unblock', registration: '', sign_up: 'inscription-eleves' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
