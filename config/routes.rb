Rails.application.routes.draw do
  root to: "tests#index" 

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#delete'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, shallow: true, except: :index  do 
    resources :questions, shallow: true,  except: :index do 
      resources :answers 
    end
    member do
      post :start
    end
  end

  resources :test_passings, only: %i[show update] do
    member do
      get :result
    end
  end
end
