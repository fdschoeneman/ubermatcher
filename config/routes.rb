Ubermatcher::Application.routes.draw do
  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
    controllers: {
      :confirmations => "confirmations", 
      :omniauth_callbacks => "omniauth_callbacks"
    }

  devise_scope :user do
    put "/confirm" => "confirmations#confirm"
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  
  match '/users/auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match '/contact',             :to => 'pages#contact'
  match '/about',               :to => 'pages#about'
  match '/help',                :to => 'pages#help'
  match '/terms',               :to => 'pages#terms'
  match '/privacy',             :to => 'pages#privacy'
  match '/signup',              :to => 'registrations#new'
  
  authenticated :user do
    root :to => 'pages#about'
  end

  match '/auth/:provider/callback' => 'authentications#create'

  resources :after_signup

  root to: 'pages#home' 
end
