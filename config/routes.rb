SocialGroupBuying::Application.routes.draw do
  root to: 'homes#show'

  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'

  get '/sign_in' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sign_out' => 'sessions#destroy'

  resources :blog_posts
end
