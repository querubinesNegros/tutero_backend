class TopicsController < ApplicationController
  def index
    topics = Topic.order("created_at DESC")
    render json: topics
  end

  def show
    topic = Topic.find(params[:id])

    render json: topic
  end

  def create
    topic = Topic.new(topic_params)

    if topic.save
      render json: topic, status: :created, location: topic
    else
      render json: topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    topic = topic.new(topic_params)
    if topic.update(topic_params)
      render json: topic
    else
      render json: topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    topic = topic.new(topic_params)
    topic.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    topic = Topic.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def topic_params
    params.require(:topic).permit(:name)
  end
end
