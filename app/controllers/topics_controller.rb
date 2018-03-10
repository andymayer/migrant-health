class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :enforce_admin, only: [:edit, :new, :update, :destroy, :create]

  # GET /topics
  def index
    @topics = Topic.all.order(:name)
  end

  # GET /topics/:slug:
  def show
    @resources = Resource.tagged_with(@topic)
  end

  # GET /topics/:slug:/edit
  def edit
  end

  # POST /topics/:slug:
  def update
    if @topic.update_attributes(topic_params)
      redirect_to topics_path, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /topics/:slug:
  def destroy
    if @topic.destroy
      redirect_to topics_path, notice: "The topic '#{@topic.name}' was successfully removed."
    end
  end

  # GET /topics/new

  def new
    @topic = Topic.new
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path, notice: 'Topic was successfully created.'
    else
      render :edit
    end
  end

  private

  def set_topic
    @topic = Topic.find_by_slug(params[:id])
    render file: "public/404", status: 404, formats: :html unless @topic
  end

  def enforce_admin
    unless current_user.try(:admin?)
      redirect_to root_path
    end

  end

  # Only allow a trusted parameter "white list" through.
  def topic_params
    params.require(:topic).permit(:name, :slug, :description)
  end

end
