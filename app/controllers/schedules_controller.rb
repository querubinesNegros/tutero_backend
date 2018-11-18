class SchedulesController < ApplicationController
  def index
    #Si es tutor o si coincide el id buscado con el usuario actual, retorna los horarios del usuario correspondiente
    cond = current_user && (current_user.userable_type == "Tutor" || params[:user_id].to_i == current_user.id.to_i) 
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
      if user.userable_type = "Student"
        user = Student.find(user.userable_id)
      elsif user.userable_type = "Tutor"
        user = Tutor.find(user.userable_id)
      end
      #schedule = Schedule.find(params[:id])
      print(params[:schedule_ids])
      print("here")
      if user.schedule_ids = params[:schedule_ids]
        print(user.schedules) 
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
