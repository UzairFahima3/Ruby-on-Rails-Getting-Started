Rails.application.routes.draw do
  devise_for :users  
    # get "/users/sign_out", to: "devise/sessions#destroy"
    # end
  # delete '/users/sign_out', to: 'devise/sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    # get '/users/sign_out', to: 'devise/sessions#destroy'
  # end
  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"
  # get "/articles",to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # post "articles/edit"
  resources :articles do
    # get "articles#:id#edit", to: "articles"
    resources :comments
  end
end
