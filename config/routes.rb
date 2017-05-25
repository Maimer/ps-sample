Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  devise_for :users, :skip => [:sessions, :registrations]

  as :user do
    get "/sign_in" => "devise/sessions#new", as: :new_user_session
    post "/sign_in" => "devise/sessions#create", as: :user_session
    delete "/sign_out" => "devise/sessions#destroy", as: :destroy_user_session
    get "/sign_up" => "devise/registrations#new", as: :new_user_registration
    post "/sign_up" => "devise/registrations#create", as: :user_registration
  end

  resources :posts, only: [:new, :create]
end
