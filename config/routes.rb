Rails.application.routes.draw do
    resources :tweets
    root 'tweets#index'
    get 'get_tweet/:id', to: 'tweets#get_tweet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
