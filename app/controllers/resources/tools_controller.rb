module Resources
  class ToolsController < ApplicationController
    before_action :set_tool, only: [:show, :edit, :update, :destroy]

    MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES = 6

    # GET /tools
    def index
      @resource_type = 'Tool'
      @tools = Tool.all
    end

    # GET /tools/1
    def show
    end

    # GET /tools/new
    def new
      @tool = Tool.new
      populate_tool_chunks
    end

    # GET /tools/1/edit
    def edit
      populate_tool_chunks
    end

    # POST /tools
    def create
      @tool = Tool.new(tool_params)

      if @tool.save
        redirect_to @tool, notice: 'Tool was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /tools/1
    def update
      if @tool.update(tool_params)
        redirect_to @tool, notice: 'Tool was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /tools/1
    def destroy
      @tool.destroy
      redirect_to resources_url, notice: 'Tool was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find_by_slug(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tool_params
      params.require(:resources_tool)
        .permit(:title, :intro, :video_url, :contributed_by,
          explanation_chunk_attributes: [:title, :intro, :content, :after],
          where_it_s_from_chunk_attributes: [:title, :intro, :content, :after],
          numbered_paragraph_chunk_attributes: [:title, :intro, :content, :after],
          attachments_chunk_attributes: [:title, :intro, :after,
          external_resources_attributes: [:title, :url]],
        )
    end

    def populate_tool_chunks
      @tool.build_explanation_chunk         if @tool.explanation_chunk.nil?
      @tool.build_where_it_s_from_chunk     if @tool.where_it_s_from_chunk.nil?
      @tool.build_numbered_paragraph_chunk  if @tool.numbered_paragraph_chunk.nil?

      if @tool.attachments_chunk.nil?
        @tool.build_attachments_chunk
        MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES.times do
          @tool.attachments_chunk.external_resources.build
        end
      else
        number_of_external_resources = @tool.attachments_chunk.external_resources.count
        if number_of_external_resources < MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES
          (MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES - number_of_external_resources).times do
             @tool.attachments_chunk.external_resources.build
          end
        end
      end
    end
  end
end
