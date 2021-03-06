class ResourcesController < ApplicationController
  include VotingConcern

  before_action :set_resource, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :set_votable, only: [:like, :unlike]
  before_action :set_resource_type, execept: :index
  before_action :set_tags

  after_action :verify_authorized, only: [:create, :new, :edit, :update, :destroy]

  MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES = 3

  # GET /resources
  def index
    @resources = @resource_class.all.order(:title)
  end

  def show
    @favourited = current_user.voted_up_on?(@resource) if current_user
  end

  def new
    # This gets the full class name from the controller and instantiates the resource
    @resource = @resource_class.new
    authorize @resource
    populate_nested_chunks
  end

  def edit
    authorize @resource
    populate_nested_chunks
  end

  def create
    @resource = @resource_class.new(resource_params)
    authorize @resource

    if @resource.save
      redirect_to @resource, notice: "#{@resource_type} was successfully created."
    else
      render :new
    end
  end

  def destroy
    authorize @resource
    @resource.destroy
    redirect_to resources_url, notice: "#{@resource_type} was successfully deleted."
  end

  def update
    authorize @resource
    if @resource.update(resource_params)
      redirect_to @resource, notice: "#{@resource_type} was successfully updated."
    else
      render :edit
    end
  end

  def like
    @reply = @resource.liked_message
    @next_path = unlike_resource_path(@resource)
    super
  end

  def unlike
    @reply = "Removed from favourites"
    @next_path = like_resource_path(@resource)
    super
  end

  private

  def classname
    @votable.class.name.split('::').first || ''
  end

  def set_resource_type
    @resource_class = Resource
    @resource_type = 'Resources'
  end

  def set_votable
    @votable = @resource
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find_by_slug(params[:id])
    render file: "public/404", status: 404, formats: :html unless @resource
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.all.order(:name)
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
