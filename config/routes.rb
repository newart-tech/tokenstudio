Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :balance_adjustments
    resources :platforms
    resources :withdrawals
  end

  resources :withdrawals
  resources :users

  resources :password_resets, only: [:new, :create, :edit, :update]

  post '/login'    => 'sessions#create'
  get '/login'     => 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  get 'balances', to: 'pages#balances'

  root to: 'pages#welcome'
end
