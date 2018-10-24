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
    schedule = Schedule.find(params[:id]).schedules

    render json: {status: "SUCCESS", message: "Loaded post", data: schedule}, status: :ok
  end

  def create
    schedule = Schedule.new(schedule_params)

    if schedule.save
      render json: schedule, status: :created, location: schedule
    else
      render json: Schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      render json: schedule
    else
      render json: Schedule.errors, status: :unprocessable_entity
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
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
