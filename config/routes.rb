Rails.application.routes.draw do
  root "events#upcoming"
  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    resources :events do
      collection do
        get "upcoming"
        get "past"
      end
    end
  end
  resources :categories, only: [:create]
end
