SocialGroupBuying::Application.routes.draw do
  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
end
