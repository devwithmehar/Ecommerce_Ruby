Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'item_search/index' => 'item_search#index', :as => 'search_page'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'items#index'
 resources :items, only: %i[index show create] do
    collection do
      get "search"
    end
  end

  resources :categories, only: %i[index show] do
    collection do
      get "search"
    end
  end

  resources :cart, only: %i[index create destroy]

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get  "success", to: "checkout#sucess", as: "checkout_success"
    get  "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end


end
