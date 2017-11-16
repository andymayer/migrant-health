class TopicsController < ApplicationController
  def index
    @topics = ActsAsTaggableOn::Tag.all.order(:name)
  end
end
