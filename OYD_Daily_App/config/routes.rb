Rails.application.routes.draw do
  resources :mlt_attendances
  resources :tests
  resources :information
  get 'sessions/new'

  resources :attendances
  resources :schools
  resources :students
  resources :users
  resources :sessions
  resources :informations
  resources :tests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'
  get 'user/:id/select_school', to: "users#select_school", as: 'select_school'
  get 'user/:id/select_date', to: "users#select_date", as: 'select_date'
  get 'school/:id/mark_attendance', to: "schools#mark_attendance", as: 'mark_attendances'
  get 'school/:id/register_student', to: "schools#register_student", as: 'register_student'
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as =>"log_out"
  get 'school/:id/add_information', to: "schools#add_information", as: 'add_information'
  
end
