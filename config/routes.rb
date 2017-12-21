Rails.application.routes.draw do
  resources :enrolls
  resources :test_courses
  resources :courses
  resources :students
  resources :scores
  resources :tests
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
