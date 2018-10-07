class ImagesController < ApplicationController
    def index
        images = Image.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded images", data: images},status: :ok
    end
    def show

        image = Image.find(params[:id]).images

        render json: {status: "SUCCESS" , message: "Loaded image", data: image},status: :ok

      end

      def create
        image = Image.new(image_params)
    
        if Image.save
          render json: image, status: :created, location: image
        else
          render json: Image.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if Image.update(image_params)
          render json: image
        else
          render json: Image.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        Image.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
          image = Image.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def image_params
          params.require(:image).permit(:name)
        end
    
end
