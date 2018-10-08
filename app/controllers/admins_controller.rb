class AdminsController < ApplicationController
    def index
        admins = Admin.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded admins", data: admins},status: :ok
    end
    def show

        admin = Admin.find(params[:id])

        render json: {status: "SUCCESS" , message: "Loaded admin", data: admin},status: :ok

        
      end

      def create
        admin = Admin.new(admin_params)
    
        if admin.save
          render json: admin, status: :created, location: admin
        else
          render json: admin.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        admin = Student.find(params[:id])
        if admin.update(admin_params)
          render json: admin
        else
          render json: admin.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        admin = Student.find(params[:id])
        admin.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_admin
          admin = Student.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def admin_params
          params.require(:admin).permit()
        end

end
