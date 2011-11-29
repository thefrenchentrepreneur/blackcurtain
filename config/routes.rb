Guessmystartup::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'guesses#new'

  resources :guesses
  # not used for now
  # root :to => 'guesses#new' 
end
