class StudentsController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      userS = []
      userm = current_user
      if current_user.userable_type == "Tutor"
        studTutor = Student.where(tutor_id: userm.userable_id)
        #studTutor.each do |st|
        #  userS.push(User.where("userable_type = ? and userable_id = ?", "Student", st.id).first)
        #end
        render json: studTutor
      end
    else
      students = Student.all
      render json: {status: "SUCCESS", message: "Loaded tutors", data: students}, status: :ok
    end
  end

  def show
    if params[:id].present?
      student = Student.find(params[:id])
      render json: student
    else
      type = User.find(params[:user_id]).userable_type
      if type == "Student"
        student_id = User.find(params[:user_id]).userable_id
        student = Student.find(student_id)
        render json: student
      else
        render json: {status: "FAIL", message: "You are not a student, you are a " + type.downcase}, status: :not_found
      end
    end
  end
 
  def create
    @student = Student.new(student_params)

    if @student.save
      id = @student.id
      #MailsSender2Job.perform_later id
      #StudentTutorMailer.tutor_assignment(@student).deliver_now
      #TutorMailer.student_assignment(@student).deliver_now
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    student = User.find(params[:id]).userable
    if student.update(student_params)
      render json: student
    else
      render json: student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    student.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    student = Student.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    params.require(:student).permit(:id_shedule, :id_tutor)
  end
end
