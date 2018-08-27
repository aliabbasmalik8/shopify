Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  
  get "contact",to: "page#contact"
  get "about", to: "page#about"
  get "error", to: "page#error"
  root "page#home"


  resources :shops do
    resources :products do 
      post :addProductId
      post :confirm_cart
    end
    resources :orders
    collection do 
      get :customer_view
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
