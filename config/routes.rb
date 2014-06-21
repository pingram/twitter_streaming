CredibleTweetstream::Application.routes.draw do
  root to: "statuses#index"
  resources :statuses, only: :index
  get 'statuses/events', to: 'statuses#events'
end
