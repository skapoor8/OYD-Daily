Rails.application.routes.draw do
  resources :attendances
  resources :schools
  resources :students
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#hello'
  get 'user/:id/select_school', to: "users#select_school", as: 'select_school'
  
end
