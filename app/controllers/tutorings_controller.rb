class TutoringsController < ApplicationController
  
  def index
    if current_user
      case current_user.userable_type
      when "Student"
        if current_user.id.to_i == params[:user_id].to_i
          tutorings = Student.getTutoringsById(current_user.userable_id)
          render json: tutorings , status: :ok
        end
      when "Tutor"
        if current_user.id.to_i == params[:user_id].to_i
          print(current_user.id.to_i)
          tutorings = Tutor.getTutorings(current_user.userable_id)
          render json: tutorings , status: :ok
        end
      end
    else
      tutorings = Tutoring.order("created_at DESC")
      render json:  tutorings,  status: :ok
    end
  end

  def show    
    @tutoring = Tutoring.find(params[:id])   
    render json: @tutoring , status: :ok
  end

  def create
    @tutoring = Tutoring.new(tutoring_params)
    
    if @tutoring.save   
      id = @tutoring.id  
      MailsSenderJob.perform_later id  
      #TutoringsMailer.recordatorioTutoria(@tutoring).deliver_later
      #TutoringsTMailer.recordatorio_tutoria_t(@tutoring).deliver_later
      render json: @tutoring, status: :created, location: @tutoring
    else
      render json: @tutoring.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    tutoring = Tutoring.find(params[:id])
    if tutoring.update(tutoring_params)
      render json: tutoring
    else
      render json: Tutoring.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    tutoring = Tutoring.find(params[:id])
    tutoring.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    tutoring = Tutoring.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tutoring_params
    params.require(:tutoring).permit(:topic_id, :type_t, :schedule_id, :date, :student_id )
  end
end
