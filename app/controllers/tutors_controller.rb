class TutorsController < ApplicationController
  def index
    tutors = Tutor.order("created_at DESC")
    render json: {status: "SUCCESS", message: "Loaded tutors", data: tutors}, status: :ok
  end

  def show
    type = User.find(params[:user_id]).userable_type
    if type == "Tutor"
      tutor_id = User.find(params[:user_id]).userable_id
      tutor = Tutor.find(tutor_id)
      render json: {status: "SUCCESS", message: "Loaded tutors", data: tutor}, status: :ok
    else
      render json: {status: "FAIL", message: "You are not a tutor, you are a " + type.downcase}, status: :not_found
    end
  end

  def create
    tutor = Tutor.new(tutor_params)
    if tutor.save
      render json: tutor, status: :created, location: tutor
    else
      render json: tutor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    tutor = Tutor.find(params[:id])
    if tutor.update(tutor_params)
      render json: tutor
    else
      render json: tutor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutors/1
  def destroy
    tutor = Tutor.find(params[:id])
    tutor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    tutor = Tutor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tutor_params
    params.require(:tutor).permit(:ammountStudents)
  end
end
