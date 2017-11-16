class ResourcesController < ApplicationController

  before_action :set_tags#, only: [:edit, :new]

  MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES = 6

  # GET /resources
  def index
    @resources = Resource.all
  end

  private

  def set_tags
    @tags = ActsAsTaggableOn::Tag.all
  end
end