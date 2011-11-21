Guessmystartup::Application.routes.draw do
  get "general/index"
  root :to => 'general#index'
end
