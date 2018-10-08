class TutoringsController < ApplicationController
    def index
        tutorings = Tutoring.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded tutorings", data: tutorings},status: :ok
    end
    def show

        tutoring = Tutoring.find(params[:id])

        render json: {status: "SUCCESS" , message: "Loaded post", data: tutoring},status: :ok

        
      end

      def create
        tutoring = Tutoring.new(tutoring_params)
    
        if tutoring.save
          render json: tutoring, status: :created, location: tutoring
        else
          render json: tutoring.errors, status: :unprocessable_entity
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
          params.require(:tutoring).permit()
        end
end
