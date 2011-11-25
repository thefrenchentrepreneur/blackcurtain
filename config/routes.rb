Guessmystartup::Application.routes.draw do
  root :to => 'guesses#new'

  resources :guesses
  # not used for now
  # root :to => 'guesses#new' 
end
