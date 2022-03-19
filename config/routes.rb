Rails.application.routes.draw do
  
  root to:'welcome#index'
  get "feeds", to:'home#index'
  
  get "course-list", to:"courses#index"
  get "lesson", to:"courses#new"
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "dashboard-admin", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  
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
    resources :results, only: [:new, :create]
  end
  
  
  resources :courses, except: %i[index new]
  resources :answers, 
            :questions,
            :results,
            :materials, execept: %i[new]
  
  
  ######### USER DATA #########
  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration
  end

  devise_for  :users,
              :path => '',
              :path_names => 
              { :sign_in =>     'connexion',
                :sign_out =>     'logout',
                :sign_up =>       '',
                :registration =>  'inscription',
                :edit =>          'edit'
              }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
