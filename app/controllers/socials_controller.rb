class SocialsController < ApplicationController
  #poner en routes la siguiente ruta
  # resources :socials
  # agregar en el modelo    scope :search, ->(params){where(email: params)}

  before_action :set_user, only: [:show]

  def index
    @user = User.search("paila@hola.com")[0]
    render json: @user
  end

  def create
    @user = User.search(params["email"])[0]
    if @user == nil
      google_user = User.new()
      google_user.email = params[:email]
      google_user.name = params[:name]
      google_user.lastname = params[:lastname]
      google_user.userable_type = params[:userable_type]
      google_user.pict = params[:image]

      case params[:userable_type]
      when "Admin"
        adm = Admin.new()
        adm.save
        google_user.userable_id = adm.id
      when "Student"
        student = Student.new()
        student.save
        print("**********************\n")
        print(student.id)
        google_user.userable = student
      end
      google_a = GoogleAcount.new()
      google_a.email = params[:email]
      google_a.save

      google_user.save
      

      


      render json: @user.errors, status: :unprocessable_entity
    else
      knock_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: knock_token
    endr
  end
end
