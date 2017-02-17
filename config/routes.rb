Rails.application.routes.draw do

  post '/registrations/signup', to: 'registrations#signup'  
  post '/auth/login', to: 'auth#login'

  resources :movies, only: [:index, :create, :show, :update, :destroy]

end
