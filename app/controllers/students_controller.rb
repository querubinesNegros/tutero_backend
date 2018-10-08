class StudentsController < ApplicationController
    def index
        students = Student.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded students", data: students},status: :ok
    end
    def show

        student = Student.find(params[:id])

        render json: {status: "SUCCESS" , message: "Loaded post", data: student},status: :ok

        
      end

      def create
        student = Student.new(student_params)
    
        if student.save
          render json: student, status: :created, location: student
        else
          render json: student.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        student = Student.find(params[:id])
        if student.update(student_params)
          render json: student
        else
          render json: student.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        student.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_student
          student = Student.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def student_params
          params.require(:student).permit(:age, :stratus, :pbm)
        end
end
