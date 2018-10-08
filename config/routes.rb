Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students do
    resources :users
  end
  resources :admins do
    resources :users
  end
  resources :tutors do
    resources :users
  end
  resources :users
  resources :careers  
  resources :posts do
    resources :fileps do
      resources :images
      resources :pdfs
    end    
  end
  
 # resources :images do
 #   resources :filpes
 # end
  resources :class_posts do
    resources :posts
  end

  resources :schedules
  resources :topics
  resources :tutorings
  
  
end
