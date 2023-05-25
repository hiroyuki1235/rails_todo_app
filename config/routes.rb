Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks

  get '/done' => 'tasks#donelist'
  post '/done/:id' => 'tasks#done', id: /\d+/
  post '/undone/:id' => 'tasks#undone', id: /\d+/
end
