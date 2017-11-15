class ResourcesController < ApplicationController

  MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES = 6

  # GET /resources
  def index
    @resources = Resource.all
  end
end
