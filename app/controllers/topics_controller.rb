class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :enforce_admin, only: [:edit, :update, :destroy]


  def index
    @topics = ActsAsTaggableOn::Tag.all.order(:name)
  end

  def show
    @resources = Resource.tagged_with(@topic)
  end

  def edit
  end

  def update
    authorize @topic
    slug_error = slug_error(@topic, topic_params[:slug])
    if slug_error
      flash.now[:error] = "ERROR: The URL slug must "+slug_error
      render :edit
    elsif @topic.update_attributes(name: topic_params[:name], slug: topic_params[:slug])
      redirect_to topics_path, notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path, notice: "The topic '#{@topic.name}' was successfully removed."
    end
  end

  private

  def set_topic
    @topic = ActsAsTaggableOn::Tag.find_by_slug(params[:id])
    render file: "public/404", status: 404, formats: :html unless @topic
  end

  def enforce_admin
    unless current_user.try(:admin?)
      redirect_to root_path
    end

  end

  # Only allow a trusted parameter "white list" through.
  def topic_params
    params.require(:acts_as_taggable_on_tag).permit(:name, :slug)
  end

  def slug_error(topic, slug)
    return "not be empty" if slug.empty?
    return "not not contain spaces" if slug.include? " "
    return "contain only alphanumeric characters" if !slug.match?(/^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$/)
    return false if slug == topic.slug
    return "be unique. (#{slug} has been used before)." if ActsAsTaggableOn::Tag.find_by_slug(slug).present?
  end

end
