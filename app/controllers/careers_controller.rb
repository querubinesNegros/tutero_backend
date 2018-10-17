class CareersController < ApplicationController
  def index
    careers = Career.order("created_at DESC")
    render json: {status: "SUCCESS", message: "Loaded careers", data: careers}, status: :ok
  end

  def show
    if Career.exists?(params[:id])
      career = Career.find(params[:id])
      render json: {status: "SUCCESS", message: "Loaded post", data: career}, status: :ok
    else
      render json: {status: "not found"}, status: :not_found
    end
  end

  def create
    career = Career.new(book_params)

    if career.save
      render json: career, status: :created, location: career
    else
      render json: career.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    areer = Career.find(params[:id])
    if career.update(student_params)
      render json: career
    else
      render json: career.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    career = Career.find(params[:id])
    career.destroy
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
