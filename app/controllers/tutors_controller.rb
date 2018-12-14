class TutorsController < ApplicationController
  def index
    tutors = Tutor.order("created_at DESC")
    render json: tutors, status: :ok
  end
  def career
    tutors = []
      if params[:career_id] == "all"
        tutors = Tutor.careerTutors(params[:career_id],0)
        render json: tutors, status: :ok
      else
        tutors = Tutor.careerTutors(params[:career_id], 1)  
        render json: tutors, status: :ok
      end
     
  end
  def get_tutors
    user = current_user
    print(current_user.career_id)
    if user.userable_type == "Student"
      tutors = Tutor.careerTutors(user.career_id, 1)
      render json: tutors, status: :ok
    else
      render status: :not_found
    end
  end
  def show
    type = User.find(params[:user_id]).userable_type
    if type == "Tutor"
      tutor_id = User.find(params[:user_id]).userable_id
      tutor = Tutor.find(tutor_id)
      render json: tutor, status: :ok
    else
      render json: {status: "FAIL", message: "You are not a tutor, you are a " + type.downcase}, status: :not_found
    end
  end

  def certificado
    tutor_id = User.find(params[:user_id]).userable_id
    @tutor = Tutor.find(tutor_id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CertificadoPdf.new(@tutor)
        send_data pdf.render, filename: "certificado_#{@tutor.user.name + @tutor.user.lastname + DateTime.now.strftime("-%m-%d-%Y")}.pdf",
                              disposition: "inline"
      end
    end
  end

  def score 

   # if current_user.userable_type = "Admin" || (current_user.userable_type == "Tutor" && current_user.id == params[:user_id])
      tutor_id = User.find(params[:user_id]).userable_id
      render json: {score: Tutor.promScoreTutorings(tutor_id), hours: Tutor.totalHoursTutorings(tutor_id) }, status: :ok
   # else
   #   render json: {status: "FAIL", message: "You don't have access" }, status: :non_authoritative_information
   # end
    
  end
  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      render json: @tutor, status: :created, location: @tutor
    else
      render json: @tutor.errors, status: :unprocessable_entity
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
