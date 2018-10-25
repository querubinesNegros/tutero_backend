class ImagesController < ApplicationController
  def index
    #  print("*************")
    #  print( Filep.where(id: params[:filep_id]).first.filepable )
    #images = Filep.where(id: params[:filep_id]).first.filepable

    render json:  Image.all
  end

  def show
    #if params[:filep_id].present?
    #  image = Filep.find(params[:filep_id]).filepable
    #elsif params[:id].present?
    #  image = Image.find(params[:id])
    #end  
    image = Image.find(params[:id])
    render json: {status: "SUCCESS", message: "Loaded image", data: image}, status: :ok
  end

  def create
    image = Image.new(image_params)
    
    if image.save
      render json: image
    else
      render json: image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    
    image = Image.new(image_params)
    if image.update(image_params)
      render json: image
    else
      render json: image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    #image = Image.new(image_params)

    image.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    image = Image.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.permit(:path)
  end
end
