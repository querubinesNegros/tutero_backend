class PostsController < ApplicationController
  def index
    posts = Post.order("created_at DESC")
    render json: {data: posts}, status: :ok
  end

  def show
    post = Post.find(params[:id])

    render json: {data: post}, status: :ok
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created, location: post
    else
      render json: Post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    post = Post.new(post_params)
    if post.update(post_params)
      render json: post
    else
      render json: Post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    post = Post.new(post_params)
    post.destroy
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
