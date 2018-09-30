class CareersController < ApplicationController
    def index
        careers = Career.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded careers", data: careers},status: :ok
    end
    def show

        career = Career.find(params[:id])

        render json: {status: "SUCCESS" , message: "Loaded post", data: career},status: :ok

        
      end

      def create
        career = Career.new(book_params)
    
        if Career.save
          render json: career, status: :created, location: career
        else
          render json: career.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if Career.update(student_params)
          render json: career
        else
          render json: Career.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        Career.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_career
          career = Career.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def career_params
          params.require(:career).permit(:name)
        end
end
