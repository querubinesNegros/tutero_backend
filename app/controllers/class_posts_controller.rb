class ClassPostsController < ApplicationController
    def index
        class_posts = ClassPost.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded class_posts", data: class_posts},status: :ok
    end
    def show

        class_post = ClassPost.find(params[:id]).class_posts

        render json: {status: "SUCCESS" , message: "Loaded post", data: class_post},status: :ok

        
      end

      def create
        class_post = ClassPost.new(class_post_params)
    
        if ClassPost.save
          render json: class_post, status: :created, location: class_post
        else
          render json: ClassPost.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if ClassPost.update(class_post_params)
          render json: class_post
        else
          render json: ClassPost.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        ClassPost.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_tutor
          class_post = ClassPost.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def class_post_params
          params.require(:class_post).permit(:name)
        end
    
end
