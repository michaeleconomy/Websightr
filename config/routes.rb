Websightr::Application.routes.draw do
  resources :sites do
    collection do
      get 'pending_approval'
    end
    member do
      post 'approve'
    end
  end
  
  resources :ratings, :comments
  
  resources :users do
    member do
      get 'sites', :to => 'sites#user'
      get 'comments', :to => 'comments#user'
    end
  end
  
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/session/fake_sign_in/:id', :to => 'sessions#fake_sign_in'
  root :to => "main#index"
end
