class UsersController < ApplicationController
  def index
    users = User.order("created_at DESC")
    render json: {status: "SUCCESS", message: "Loaded users", data: users}, status: :ok
  end

  def show
    user = User.find(params[:id])

    render json: {status: "SUCCESS", message: "Loaded post", data: user}, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :lastname, :password)
  end
end
