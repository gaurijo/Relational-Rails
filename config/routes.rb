Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/students', to: 'students#index'
  get '/schools', to: 'schools#index'
  get '/schools/:id', to: 'schools#show'
end
