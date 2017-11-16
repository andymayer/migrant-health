class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :set_tags

  MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES = 3

  # GET /resources
  def index
    @resources = Resource.all
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find_by_slug(params[:id])
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.all
  end

  def build_external_resources_and_attachments(further_information_chunk)
    further_information_chunk.external_resources.build
    further_information_chunk.uploaded_attachments.build
  end

  def populate_external_resources_and_attachments(further_information_chunk)
    number_of_external_resources = further_information_chunk.external_resources.count
    if number_of_external_resources < MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES
      (MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES - number_of_external_resources).times do
        further_information_chunk.external_resources.build
      end
    end
    number_of_uploaded_attachments = further_information_chunk.uploaded_attachments.count
    if number_of_uploaded_attachments < MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES
      (MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES - number_of_uploaded_attachments).times do
        further_information_chunk.uploaded_attachments.build
      end
    end
  end
end