Rails.application.routes.draw do
  get "payments/new"
  get "payments/create"
  devise_for :buyers, controllers: {
    registrations: "buyers/registrations",
    sessions: "buyers/sessions"
  }
  
  resources :products do
   member do
    post 'add_to_cart'
    get 'profile' 
   end
  end
  
  resources :payments, only: [:new, :create]


  resources :categories, only: [:new, :create]

  resources :carts, only: [:show] do
    resources :cart_items, only: [:destroy] do
      member do
        patch 'decrement'
        patch 'increment'
        #do
      #patch 'decrement', on: :member  # This creates the /cart/cart_items/:id/decrement route
    end
  end
  end

  devise_for :sellers, controllers: {
    registrations: "sellers/registrations",
    session: "sellers/session"
  }
  root "products#index"

  resources :orders, only: [:new, :create, :index]

  # post 'place_order', to: 'orders#create', as: 'place_order'
  # get 'address_form', to: 'orders#address_form', as: 'address_form'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
