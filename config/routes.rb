Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students do
    resources :users
  end

  
  resources :users
  resources :admins
  resources :tutors
  resources :careers
  resources :posts
  resources :pdfs
  resources :images
  resources :fileps
  resources :class_posts
  resources :schedules
  resources :topics
  resources :tutorings
  
  
end
