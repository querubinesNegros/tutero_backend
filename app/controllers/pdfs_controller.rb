class PdfsController < ApplicationController
  def index
    pdfs = Filep.where(id: params[:filep_id]).first.filepable
    #pdfs = Pdf.order('created_at DESC');
    render json: {status: "SUCCESS", message: "Loaded pdfs", data: pdfs}, status: :ok
  end

  def show
    if params[:filep_id].present?
      pdf = Filep.find(params[:filep_id]).filepable
    elsif params[:id].present?
      pdf = Pdf.find(params[:id]).pdfs
    end
    render json: {status: "SUCCESS", message: "Loaded pdf", data: pdf}, status: :ok
  end

  def create
    pdf = Pdf.new(pdf_params)

    if pdf.save
      render json: pdf, status: :created, location: pdf
    else
      render json: Pdf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if pdf.update(pdf_params)
      render json: pdf
    else
      render json: Pdf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    pdf = Pdf.find(params[:id])
    pdf.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    pdf = Pdf.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pdf_params
    params.require(:pdf).permit(:name)
  end
end
