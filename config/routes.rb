Rails.application.routes.draw do
  resources :courses

  get "/dashboard" => "dashboard#index"

  root "courses#courses_index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
