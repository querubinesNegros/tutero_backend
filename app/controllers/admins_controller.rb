class AdminsController < ApplicationController
  def index
    admins = Admin.order("created_at DESC")
    render json: admins
  end

  def show
    if params[:id].present?
      admin = Admin.find(params[:id])
      render json: admin
    elsif params[:user_id].present?
      type = User.find(params[:user_id]).userable_type
      if type == "Admin"
        admin_id = User.find(params[:user_id]).userable_id
        admin = Admin.find(admin_id)
        render json:  admin
      else
        render json: {status: "FAIL", message: "You are not a admin, you are a " + type.downcase}, status: :not_found
      end
    end
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
    admin = Admin.find(params[:id])
    if admin.update(admin_params)
      render json: admin
    else
      render json: admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    admin = Admin.find(params[:id])
    admin.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    admin = Admin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def admin_params
    params.require(:admin).permit()
  end
end
