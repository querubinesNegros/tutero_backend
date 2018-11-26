class SchedulesController < ApplicationController
  def index
    #Si es tutor o si coincide el id buscado con el usuario actual, retorna los horarios del usuario correspondiente
    cond = current_user && (current_user.userable_type == "Tutor" || params[:user_id].to_i == current_user.id.to_i) 
    print("*******\n")
    print(current_user.id)
    if params[:user_id].present? && cond    
      msg = "Loaded schedules user"
      schedules = User.find(params[:user_id]).userable.schedules
    else
      schedules = Schedule.order("created_at DESC")
      msg = "Loaded every schedules"
    end
    render json: schedules, status: :ok, message: msg 
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: {status: "SUCCESS", message: "Loaded post", data: schedule}, status: :ok
  end
  
  def create
    if params[:user_id].present? && current_user.id.to_i == params[:user_id].to_i
      user = User.find(current_user.id)
      #POST   /users/:user_id/student/schedules(.:format)                                              schedules#create
      if user.userable_type == "Student"
        user = user.userable
      elsif user.userable_type == "Tutor"
        user = user.userable
      end
      
      #schedule = Schedule.find(params[:id])
      print("*********\n")
      print(user.id )
      print("here")
      if user.schedule_ids = params[:ids][:schedule_ids]
        print(user.schedules)              
        user = User.find(current_user.id)
        if user.userable_type == "Student" then 
          student_id = user.userable.id         
          idTutorToAssign = Tutor.findTutorToStudent(student_id)
          print("*************************\n")
          tutorToAssign = Tutor.find(idTutorToAssign)
          print("*************************\n")
          
          print(idTutorToAssign)
          
          student.tutor = tutorToAssign
          student.save
          tutorToAssign.ammountStudents = tutorToAssign.ammountStudents + 1
          tutorToAssign.save
          MailsSender2Job.perform_later student_id
        end
        user = user.userable
        
        render json: user.schedules, status: :ok, message: "Add schedule to user"
      else
        render json: user.errors, status: :unprocessable_entity, message: "don't allow"
      end
    else
      schedule = Schedule.new(schedule_params)
      if schedule.save
        render json: schedule, status: :created, location: schedule
      else
        render json: schedule.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if schedule.update(schedule_params)
      render json: schedule
    else
      render json: schedule.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if params[:user_id].present?
      user = User.find(params[:user_id])
      user.userable.schedules.delete(Schedule.find(params[:id]))
      render json: user.userable.schedules
    else
      schedule = Schedule.find(params[:id])
      schedule.destroy
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    schedule = Schedule.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def schedule_params
    params.require(:schedule).permit(:name, :hour)
  end
end
