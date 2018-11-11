class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students
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
      StudentTutorMailer.tutor_assignment(@student).deliver_now
      TutorMailer.student_assignment(@student).deliver_now 
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    student = Student.find(params[:id])
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
    params.require(:student).permit(:id_shedule)
  end
end
