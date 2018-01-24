Rails.application.routes.draw do
  resources :attendances
  resources :schools
  resources :students
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'
  get 'user/:id/select_school', to: "users#select_school", as: 'select_school'
  get 'user/:id/select_date', to: "users#select_date", as: 'select_date'
  get 'school/:id/mark_attendance', to: "schools#mark_attendance", as: 'mark_attendances'
  
end
