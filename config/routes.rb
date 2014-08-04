Rails.application.routes.draw do

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

  end
  
  root 'welcome#index'
  get 'ie_compatibility', to: 'static_pages#ie_compatibility'

  resources :sectors, only: [:show], :path => '/' do
    resources :posts, only: [:index, :show]
  end
  #get ':unique_name', to: 'sectors#show', as: :public_sector

end
