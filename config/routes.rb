Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get '/schools', to: 'schools#index'
  get '/schools/:id', to: 'schools#show'
  get 'schools/:school_id/students', to: 'school_students#index'
end
