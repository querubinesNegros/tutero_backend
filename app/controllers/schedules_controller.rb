class SchedulesController < ApplicationController
    def index
        schedules = Schedule.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded schedules", data: schedules},status: :ok
    end
    def show

        schedule = Schedule.find(params[:id]).schedules

        render json: {status: "SUCCESS" , message: "Loaded post", data: schedule},status: :ok

        
      end

      def create
        schedule = Schedule.new(book_params)
    
        if Schedule.save
          render json: schedule, status: :created, location: schedule
        else
          render json: Schedule.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if Schedule.update(schedule_params)
          render json: schedule
        else
          render json: Schedule.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        Schedule.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_tutor
          schedule = Schedule.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def schedule_params
          params.require(:schedule).permit(:name , :hour)
        end
end
