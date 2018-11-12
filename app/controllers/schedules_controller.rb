class SchedulesController < ApplicationController
  def index
    if params[:user_id].present?
      schedules = User.find(params[:user_id]).userable.schedules
    else
      schedules = Schedule.order("created_at DESC")
    end

    render json: schedules
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: {status: "SUCCESS", message: "Loaded post", data: schedule}, status: :ok
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      render json: schedule, status: :created, location: schedule
    else
      render json: schedule.errors, status: :unprocessable_entity
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    if params[:user_id].present?
      user = User.find(params[:user_id])
      if user.userable_type = "Student"
        user = Student.find(user.userable_id)
      elsif  user.userable_type = "Tutor"
        user = Tutor.find(user.userable_id)
      end
      if user.schedules << schedule
        render json: user.schedules
      else

      end
    else
    
      if schedule.update(schedule_params)
        render json: schedule
      else
        render json: schedule.errors, status: :unprocessable_entity
      end

    end
    
    
  end

  def destroy
    if  params[:user_id].present?
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
