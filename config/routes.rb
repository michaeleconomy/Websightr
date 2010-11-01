Websightr::Application.routes.draw do
  resources :sites, :ratings, :comments
  
  match '/auth/:provider/callback', :to => 'sessions#create'
  root :to => "main#index"
end
