class RecreationsController < ApplicationController
  before_action :set_recreation, only: [:show, :update, :destroy]

  # GET /recreations
  def index
    @recreations = Recreation.all
    render json: @recreations
  end

  # GET /recreations/1
  def show
    render json: @recreation
  end

  # POST /recreations
  def create
    @recreation = Recreation.new(recreation_params)

    if @recreation.save
      render json: @recreation, status: :created, location: @recreation
    else
      render json: @recreation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recreations/1
  def update
    if @recreation.update(recreation_params)
      render json: @recreation
    else
      render json: @recreation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recreations/1
  def destroy
    @recreation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recreation
      @recreation = Recreation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recreation_params
      params.permit(:path, :name)
    end
end
