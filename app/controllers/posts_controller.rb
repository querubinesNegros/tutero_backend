class PostsController < ApplicationController
    def index
        posts = Post.order('created_at DESC');
        render json: {status: "SUCCESS" , message: "Loaded posts", data: posts},status: :ok
    end
    def show

        post = Post.find(params[:id]).posts

        render json: {status: "SUCCESS" , message: "Loaded post", data: post},status: :ok

        
      end

      def create
        post = Post.new(post_params)
    
        if Post.save
          render json: post, status: :created, location: post
        else
          render json: Post.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if Post.update(post_params)
          render json: post
        else
          render json: Post.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        Post.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
          post = Post.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def post_params
          params.require(:post).permit(:name)
        end
end
