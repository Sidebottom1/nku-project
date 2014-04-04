NkuProject::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  resources :requests, :bakers, :sessions
  
  root to: "requests#index"
end
