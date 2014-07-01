Rails.application.routes.draw do

  root 'welcome#index'

  resources :sectors, only: [:index, :show]

  namespace :admin do
    get '', to: 'sessions#new'
    delete 'logout', to: 'sessions#destroy'
    
    get 'gallery', to: 'static_pages#gallery'
    
    resources :sessions, only: [:new, :create, :destroy]
    resources :sectors, only: [:show, :update, :edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :uploaded_files, only: [:new, :create]
    resources :posts, except: [:show]

    resources :slides, except: [:edit, :show] do
      post :sort, on: :collection
    end

    resources :items, except: [:edit, :show] do
      post :sort, on: :collection
    end

  end
end
