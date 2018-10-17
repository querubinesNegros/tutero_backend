class FilepsController < ApplicationController
  def index
    filesps = Filep.where(post_id: params[:post_id])

    render json: {status: "SUCCESS", message: "Loaded filesps", data: filesps}, status: :ok
  end

  def show
    filesp = Filep.find(params[:id])

    render json: {status: "SUCCESS", message: "Loaded filesp", data: filesp}, status: :ok
  end

  def create
    filesp = Filep.new(filep_params)

    if filesp.save
      render json: filesp, status: :created, location: filesp
    else
      render json: filesp.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    filesp = Filep.new(filep_params)
    if filesp.update(filep_params)
      render json: filesp
    else
      render json: Filep.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    filesp = Filep.new(filep_params)
    filesp.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_file
    filesp = Filep.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def filep_params
    params.require(:filesp).permit()
  end
end
