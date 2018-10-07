class FilepsController < ApplicationController
    def index
        filesps = Filep.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded filesps", data: filesps},status: :ok
    end
    def show

        filesp = Filep.find(params[:id]).filesps

        render json: {status: "SUCCESS" , message: "Loaded filesp", data: filesp},status: :ok

        
      end

      def create
        filesp = Filep.new(filep_params)
    
        if Filep.save
          render json: filesp, status: :created, location: filesp
        else
          render json: Filep.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if Filep.update(filep_params)
          render json: filesp
        else
          render json: Filep.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        Filep.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_file
          filesp = Filep.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def filep_params
          params.require(:filesp).permit(:name)
        end
end
