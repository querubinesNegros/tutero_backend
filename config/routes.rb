# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#               recreations GET    /recreations(.:format)                                                                   recreations#index
#                           POST   /recreations(.:format)                                                                   recreations#create
#                recreation GET    /recreations/:id(.:format)                                                               recreations#show
#                           PATCH  /recreations/:id(.:format)                                                               recreations#update
#                           PUT    /recreations/:id(.:format)                                                               recreations#update
#                           DELETE /recreations/:id(.:format)                                                               recreations#destroy
#                user_token POST   /user_token(.:format)                                                                    user_token#create
#             users_current GET    /users/current(.:format)                                                                 users#current
#             users_mytutor GET    /users/mytutor(.:format)                                                                 users#mytutor
#              users_create POST   /users/create(.:format)                                                                  users#create
#                           GET    /users/type/:em/:end(.:format)                                                           users#typeuser
#                users_type POST   /users/type(.:format)                                                                    users#typeuserp
#                           GET    /posts/page/:page(.:format)                                                              posts#index
#                           GET    /users/:user_id/tutor/tutorings/page/:page(.:format)                                     tutorings#index
#                           GET    /users/:user_id/tutor/tutorings/pages(.:format)                                          tutorings#getpages
#                           GET    /users/page/:page(.:format)                                                              users#index
#               users_pages GET    /users/pages(.:format)                                                                   users#getpages
#                           GET    /users/:user_id/tutor/certificado(.:format)                                              tutors#certificado
#             users_cmp_psw POST   /users/cmp_psw(.:format)                                                                 users#cmpass
#                           GET    /users/:user_id/admin/estadisticas(.:format)                                             admins#estadisticas
#               posts_pages GET    /posts/pages(.:format)                                                                   posts#getpages
#                   socials GET    /socials(.:format)                                                                       socials#index
#                           POST   /socials(.:format)                                                                       socials#create
#                    social GET    /socials/:id(.:format)                                                                   socials#show
#                           PATCH  /socials/:id(.:format)                                                                   socials#update
#                           PUT    /socials/:id(.:format)                                                                   socials#update
#                           DELETE /socials/:id(.:format)                                                                   socials#destroy
#                   careers GET    /careers(.:format)                                                                       careers#index
#                           POST   /careers(.:format)                                                                       careers#create
#                    career GET    /careers/:id(.:format)                                                                   careers#show
#                           PATCH  /careers/:id(.:format)                                                                   careers#update
#                           PUT    /careers/:id(.:format)                                                                   careers#update
#                           DELETE /careers/:id(.:format)                                                                   careers#destroy
#                     posts GET    /posts(.:format)                                                                         posts#index
#                           POST   /posts(.:format)                                                                         posts#create
#                      post GET    /posts/:id(.:format)                                                                     posts#show
#                           PATCH  /posts/:id(.:format)                                                                     posts#update
#                           PUT    /posts/:id(.:format)                                                                     posts#update
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy
#                           GET    /recreations(.:format)                                                                   recreations#index
#                           POST   /recreations(.:format)                                                                   recreations#create
#                           GET    /recreations/:id(.:format)                                                               recreations#show
#                           PATCH  /recreations/:id(.:format)                                                               recreations#update
#                           PUT    /recreations/:id(.:format)                                                               recreations#update
#                           DELETE /recreations/:id(.:format)                                                               recreations#destroy
#               filep_image GET    /fileps/:filep_id/image(.:format)                                                        images#show
#                           PATCH  /fileps/:filep_id/image(.:format)                                                        images#update
#                           PUT    /fileps/:filep_id/image(.:format)                                                        images#update
#                           DELETE /fileps/:filep_id/image(.:format)                                                        images#destroy
#                           POST   /fileps/:filep_id/image(.:format)                                                        images#create
#                 filep_pdf GET    /fileps/:filep_id/pdf(.:format)                                                          pdfs#show
#                           PATCH  /fileps/:filep_id/pdf(.:format)                                                          pdfs#update
#                           PUT    /fileps/:filep_id/pdf(.:format)                                                          pdfs#update
#                           DELETE /fileps/:filep_id/pdf(.:format)                                                          pdfs#destroy
#                           POST   /fileps/:filep_id/pdf(.:format)                                                          pdfs#create
#               post_fileps GET    /posts/:post_id/fileps(.:format)                                                         fileps#index
#                           POST   /posts/:post_id/fileps(.:format)                                                         fileps#create
#                     filep GET    /fileps/:id(.:format)                                                                    fileps#show
#                           PATCH  /fileps/:id(.:format)                                                                    fileps#update
#                           PUT    /fileps/:id(.:format)                                                                    fileps#update
#                           DELETE /fileps/:id(.:format)                                                                    fileps#destroy
#          user_admin_posts GET    /users/:user_id/admin/posts(.:format)                                                    posts#index
#                           POST   /users/:user_id/admin/posts(.:format)                                                    posts#create
#                           GET    /posts/:id(.:format)                                                                     posts#show
#                           PATCH  /posts/:id(.:format)                                                                     posts#update
#                           PUT    /posts/:id(.:format)                                                                     posts#update
#                           DELETE /posts/:id(.:format)                                                                     posts#destroy
#                user_admin GET    /users/:user_id/admin(.:format)                                                          admins#show
#                           PATCH  /users/:user_id/admin(.:format)                                                          admins#update
#                           PUT    /users/:user_id/admin(.:format)                                                          admins#update
#                           DELETE /users/:user_id/admin(.:format)                                                          admins#destroy
#                           POST   /users/:user_id/admin(.:format)                                                          admins#create
#    user_student_schedules GET    /users/:user_id/student/schedules(.:format)                                              schedules#index
#                           POST   /users/:user_id/student/schedules(.:format)                                              schedules#create
#                  schedule GET    /schedules/:id(.:format)                                                                 schedules#show
#                           PATCH  /schedules/:id(.:format)                                                                 schedules#update
#                           PUT    /schedules/:id(.:format)                                                                 schedules#update
#                           DELETE /schedules/:id(.:format)                                                                 schedules#destroy
#    user_student_tutorings GET    /users/:user_id/student/tutorings(.:format)                                              tutorings#index
#                           POST   /users/:user_id/student/tutorings(.:format)                                              tutorings#create
#                  tutoring GET    /tutorings/:id(.:format)                                                                 tutorings#show
#                           PATCH  /tutorings/:id(.:format)                                                                 tutorings#update
#                           PUT    /tutorings/:id(.:format)                                                                 tutorings#update
#                           DELETE /tutorings/:id(.:format)                                                                 tutorings#destroy
#              user_student GET    /users/:user_id/student(.:format)                                                        students#show
#                           PATCH  /users/:user_id/student(.:format)                                                        students#update
#                           PUT    /users/:user_id/student(.:format)                                                        students#update
#                           DELETE /users/:user_id/student(.:format)                                                        students#destroy
#                           POST   /users/:user_id/student(.:format)                                                        students#create
#      user_tutor_schedules GET    /users/:user_id/tutor/schedules(.:format)                                                schedules#index
#                           POST   /users/:user_id/tutor/schedules(.:format)                                                schedules#create
#                           GET    /schedules/:id(.:format)                                                                 schedules#show
#                           PATCH  /schedules/:id(.:format)                                                                 schedules#update
#                           PUT    /schedules/:id(.:format)                                                                 schedules#update
#                           DELETE /schedules/:id(.:format)                                                                 schedules#destroy
#      user_tutor_tutorings GET    /users/:user_id/tutor/tutorings(.:format)                                                tutorings#index
#                           POST   /users/:user_id/tutor/tutorings(.:format)                                                tutorings#create
#                           GET    /tutorings/:id(.:format)                                                                 tutorings#show
#                           PATCH  /tutorings/:id(.:format)                                                                 tutorings#update
#                           PUT    /tutorings/:id(.:format)                                                                 tutorings#update
#                           DELETE /tutorings/:id(.:format)                                                                 tutorings#destroy
#       user_tutor_students GET    /users/:user_id/tutor/students(.:format)                                                 students#index
#                user_tutor GET    /users/:user_id/tutor(.:format)                                                          tutors#show
#                           PATCH  /users/:user_id/tutor(.:format)                                                          tutors#update
#                           PUT    /users/:user_id/tutor(.:format)                                                          tutors#update
#                           DELETE /users/:user_id/tutor(.:format)                                                          tutors#destroy
#                           POST   /users/:user_id/tutor(.:format)                                                          tutors#create
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                    topics GET    /topics(.:format)                                                                        topics#index
#                           POST   /topics(.:format)                                                                        topics#create
#                     topic GET    /topics/:id(.:format)                                                                    topics#show
#                           PATCH  /topics/:id(.:format)                                                                    topics#update
#                           PUT    /topics/:id(.:format)                                                                    topics#update
#                           DELETE /topics/:id(.:format)                                                                    topics#destroy
#          class_post_posts GET    /class_posts/:class_post_id/posts(.:format)                                              posts#index
#           class_post_post GET    /class_posts/:class_post_id/posts/:id(.:format)                                          posts#show
#               class_posts GET    /class_posts(.:format)                                                                   class_posts#index
#                           POST   /class_posts(.:format)                                                                   class_posts#create
#                class_post GET    /class_posts/:id(.:format)                                                               class_posts#show
#                           PATCH  /class_posts/:id(.:format)                                                               class_posts#update
#                           PUT    /class_posts/:id(.:format)                                                               class_posts#update
#                           DELETE /class_posts/:id(.:format)                                                               class_posts#destroy
#                 schedules GET    /schedules(.:format)                                                                     schedules#index
#                           POST   /schedules(.:format)                                                                     schedules#create
#                           GET    /schedules/:id(.:format)                                                                 schedules#show
#                           PATCH  /schedules/:id(.:format)                                                                 schedules#update
#                           PUT    /schedules/:id(.:format)                                                                 schedules#update
#                           DELETE /schedules/:id(.:format)                                                                 schedules#destroy
#                 tutorings GET    /tutorings(.:format)                                                                     tutorings#index
#                           POST   /tutorings(.:format)                                                                     tutorings#create
#                           GET    /tutorings/:id(.:format)                                                                 tutorings#show
#                           PATCH  /tutorings/:id(.:format)                                                                 tutorings#update
#                           PUT    /tutorings/:id(.:format)                                                                 tutorings#update
#                           DELETE /tutorings/:id(.:format)                                                                 tutorings#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

#
Rails.application.routes.draw do
  resources :recreations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
  get 'users/mytutor' => 'users#mytutor'
  post   '/users/create'   => 'users#create'
  get '/users/type/:em/:end' =>  'users#typeuser' 
  post '/users/type/' =>  'users#typeuserp' 
 
  get '/posts/page/:page' =>  'posts#index' 
  
  get '/users/:user_id/tutor/tutorings/page/:page' => 'tutorings#index'
  get '/users/:user_id/tutor/tutorings/pages' =>  'tutorings#getpages'
  
  
  get '/users/page/:page' =>  'users#index' 
  get '/users/pages' =>  'users#getpages'
  get '/users/:user_id/tutor/certificado' =>  'tutors#certificado'
  post '/users/cmp_psw' => 'users#cmpass'
  get '/users/:user_id/admin/estadisticas' => 'admins#estadisticas'
  get '/tutors/career/:career_id' => 'tutors#career'

  get '/users/:user_id/tutor/score' =>  'tutors#score'
  get '/users/:user_id/student/get_tutors' =>  'tutors#get_tutors'
  #resources :users 
  get '/posts/pages' =>  'posts#getpages'
  resources :socials 
  resources :careers
  resources :posts

  resources :recreations

  
  
  

#=begin
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
        resources :students , only:[:index]
    end
  end
  resources :topics
  

  resources :class_posts do
     resources :posts , only: [:show , :index]
   end
   resources :schedules
   resources :tutorings
#=end

end
