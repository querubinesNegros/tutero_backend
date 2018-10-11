class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  before_action :set_user, only: [:show]
  def current
    print("sada\n")

    print(params)
     print("\nsada\n")
   
    render json: current_user
  end
  

  def index
    userm = current_user
  
    userS = []
    if userm   
      if userm.userable_type =="Admin"
        userCareer = User.where(userable_type: "Student" , career_id: userm.career_id)
        render json: {status: "SUCCESS", message: "Loaded users", data: userCareer}, status: :ok
      elsif userm.userable_type =="Tutor"
        
         studTutor = Student.where( tutor_id: userm.userable_id)
         studTutor.each do |st|
            userS.push( User.where("userable_type = ? and userable_id = ?","Student" , st.id ).first)
         end
        render json: {status: "SUCCESS", message: "Loaded students of tutors", data: userS}, status: :ok

      end
    else
      render json: {status: "SUCCESS", message: "Loaded users", data: current_user}, status: :ok

    end
    
  end

  def show
    user = User.find(params[:id])

    render json: {status: "SUCCESS", message: "Loaded post", data: user}, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :lastname,:email, :password, :password_confirmation)
  end
  
end
