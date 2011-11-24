Guessmystartup::Application.routes.draw do
  root :to => 'guesses#new'
  resources :guesses
end
