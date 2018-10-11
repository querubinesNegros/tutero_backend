# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                user_token POST   /user_token(.:format)                                                                    user_token#create
#             users_current GET    /users/current(.:format)                                                                 users#current
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

#
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
  resources :users

=begin

  resources :users do
    resource :admin do
      resources :posts, shallow: true do
        resources :fileps, shallow: true do
          resource :image
          resource :pdf
        end
      end
    end
    resource :student, shallow: true do
      resources :schedules
      resources :tutorings
    end
    resource :tutor, shallow: true do
      resources :schedules
      resources :tutorings
    end
  end
  resources :students
  resources :tutors
  resources :admins
  resources :careers
  resources :topics
  resources :schedules

  #resources :class_posts do
  #   resources :posts
  # end
  # resources :schedules
  # resources :tutorings
=end

end
