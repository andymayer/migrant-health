class TopicsController < ApplicationController
  def index
    @topics = ActsAsTaggableOn::Tag.all.order(:name)
  end

  def show
    @topic = ActsAsTaggableOn::Tag.find_by_slug(params[:id])
    @resources = Resource.tagged_with(@topic)
  end
end
