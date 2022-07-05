Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "home/index"
  get "/",to:"home#index"
  get '/todos', to:'home#showAllTasks'
  get "/todos/:id", to:"home#findById"
  post "/addTask", to:"home#addTask"
  put "/todos/:id", to:"home#updateById"
  delete "/todos/:id", to:"home#deleteById"
end






