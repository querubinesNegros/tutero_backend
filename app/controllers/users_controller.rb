class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  before_action :set_user, only: [:show]

  def current
    render json: current_user
  end
  def typeuser

    eml = params[:em]
    ends = params[:end] 

    eml = eml +"."+ ends
    type = User.getType(eml)
    render json: {status: "SUCCESS", message: "Loaded TUTOR", data: type}, status: :ok

  end
  def typeuserp

    email = params[:email]
    print("*********")
    print(params)
    type = User.getType(email)
    render json: {status: "SUCCESS", message: "Loaded TUTOR", data: type}, status: :ok


    print(email)
  end

  def mytutor
    userm = current_user
    if  userm && userm.userable_type == "Student"
      tutor = Student.getMyTutor(userm.userable_id) #Tutor.select("tutors.id, name, lastname , cellphone , email").joins(:user).where()
      render json: {status: "SUCCESS", message: "Loaded TUTOR", data: tutor}, status: :ok
    else
      render json: {status: "student not found", message: "you are not a student", data: nil}, status: :not_found
    end
  end

  def index
    userm = current_user
    userS = []
    
    if userm
      if userm.userable_type == "Admin"
        userCareer = User.getUsersByCareer(userm.career_id).paginate(:page => params[:page], :per_page => 20)
        render json: {status: "SUCCESS", message: "Loaded users", data: userCareer}, status: :ok
      elsif userm.userable_type == "Tutor"
        studTutor = Student.studentsOfTutor(userm.userable_id) #Student.where( tutor_id: userm.userable_id)
        studTutor.each do |st|
          userS.push(User.where("userable_type = ? and userable_id = ?", "Student", st.id).first)
        end
        render json: {status: "SUCCESS", message: "Loaded students of tutors", data: userS}, status: :ok
      elsif userm.userable_type == "Student"

        infoStudent = Student.showInfo(userm.userable_id) #Tutor.select("tutors.id, name, lastname , cellphone , email").joins(:user).where()
        render json: {status: "SUCCESS", message: "Loaded TUTOR", data: infoStudent}, status: :ok
      end
    else
      render json: {status: "SUCCESS", message: "Loaded  ALL users", data: User.paginate(:page => params[:page], :per_page => 20)}, status: :ok
    end
  end

  def show
    user = User.find(params[:id])

    render json: {status: "SUCCESS", message: "Loaded post", data: user}, status: :ok
  end

  def create
    user = User.new(user_params)
   
    if user.save
      case user_params[:userable_type] 
      when "Admin"
        adm = Admin.new()
        adm.save 
        user.userable_id = adm.id 
      when "Student"
        student = Student.new(student_params)
        student.save
        user.userable_id = student.id
      end
      user.save
      render json: user, status: :created, location: user.password  
    else
      render json: user.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /books/1
  def update
    user = User.find(params[:id])
    if user.update(params_update)
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
  def params_update
    params.require(:user).permit(:name, :lastname, :password, :password_confirmation, :cellphone)
  end
  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation , :cellphone, :userable_type )
  end
  def student_params
    params.require(:student).permit(:pbm , :stratus , :age)
  end
end
