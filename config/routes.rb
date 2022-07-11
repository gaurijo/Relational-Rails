Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get 'schools/:school_id/students', to: 'school_students#index'
  get '/schools/:school_id/students/new', to: 'school_students#new'
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  post '/schools', to: 'schools#create'
  get '/schools/:id', to: 'schools#show'
  get '/schools/:id/edit', to: 'schools#edit'
  patch '/schools/:id', to: 'schools#update'
end
