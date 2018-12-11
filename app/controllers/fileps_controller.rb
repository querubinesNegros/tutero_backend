class FilepsController < ApplicationController
  def index
    filesps = Filep.where(post_id: params[:post_id])
    render json: filesps
  end

  def show
    filesp = Filep.find(params[:id])
    render json: {status: "SUCCESS", message: "Loaded filesp", data: filesp}, status: :ok
  end

  def create
    #POST   /posts/:post_id/fileps(.:format)

    puts("***********************\n")
    name_file = params[:name]
    id = params[:post_id]
    path = params[:path]

    if params[:type] == "pdf"
      data = Pdf.new(path: path)

    else
      data = Image.new(path: path)

    end
    if data.save
      filep = Filep.new(name: name_file, post_id: id)
      filep.filepable = data
      if filep.save
        render json: data
      else
        render json: filep.errors, status: :unprocessable_entity
      end
    else
      render json: data.errors, status: :unprocessable_entity
    end

    #post = Post.new(post_params)
    #filesp = Filep.new(filep_params)
    # if filesp.save
    #  render json: filesp, status: :created, location: filesp
    #else
    # render json: filesp.errors, status: :unprocessable_entity
    #end
  end

  # PATCH/PUT /books/1
  def update
    filesp = Filep.new(filep_params)
    if filesp.update(filep_params[:type])
      render json: filesp
    else
      render json: filesp.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    filesp = Filep.new(filep_params)
    filesp.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_file
    filesp = Filep.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:class_post_id, :admin_id, :name, :description, :addressedTo)
  end

  def filep_params
    params.permit(:type, :path)
  end
end
