Rails.application.routes.draw do

  # ADMIN ROUTES
  namespace :admin do
    get '', to: 'sessions#new'
    delete 'logout', to: 'sessions#destroy'
    
    get 'gallery', to: 'static_pages#gallery'

    resources :sessions, only: [:new, :create, :destroy]
    resources :sectors, only: [:show, :update, :edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :uploaded_files, only: [:new, :create]
    resources :posts, except: [:show]

    resources :slides, except: [:edit, :update, :show] do
      post :sort, on: :collection
    end

    resources :items, except: [:edit, :update, :show] do
      post :sort, on: :collection
    end

    resources :banners, except: [:edit, :update, :show] do
      get 'new_vertical', on: :new
      get 'new_horizontal', on: :new
      post :v_sort, on: :collection
      post :h_sort, on: :collection
    end

    resources :static_pages, only: [:index, :edit, :update]

    resources :categories, except: [:show] do
      post :sort, on: :collection
    end

  end
  
  # PUBLIC ROUTES
  root 'welcome#index'
  get 'ie_compatibility', to: 'static_pages#ie_compatibility'
  get 'polisportiva', to: 'static_pages#show', defaults: { page_id: 'polisportiva', sector_id: 'societa' }
  get 'statuto', to: 'static_pages#show', defaults: { page_id: 'statuto', sector_id: 'societa' }
  get 'storia', to: 'static_pages#show', defaults: { page_id: 'storia', sector_id: 'societa' }
  get 'codice_etico', to: 'static_pages#show', defaults: { page_id: 'codice_etico', sector_id: 'societa' }

  resources :sectors, only: [:show], :path => '/' do
    resources :categories, only: [:index, :show]
    resources :posts, only: [:index, :show]
    resources :items, only: [:index, :show, :question] do
      post 'question', to: 'items#question'
    end
    resources :photos, only: [:index, :show]
    get 'contatti', to: 'static_pages#show', defaults: { page_id: 'contatti' }
  end

  #get :page_id, to: 'static_pages#show'


end
