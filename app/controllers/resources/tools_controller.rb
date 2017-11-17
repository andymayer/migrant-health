module Resources
  class ToolsController < ResourcesController

    # GET /tools
    def index
      @resource_type = 'Tool'
      @resources = Tool.all
    end

    # GET /tools/new
    def new
      @resource = Tool.new
      populate_tool_chunks
    end

    # GET /tools/1/edit
    def edit
      populate_tool_chunks
    end

    # POST /tools
    def create
      @resource = Tool.new(tool_params)

      if @resource.save
        redirect_to @resource, notice: 'Tool was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /tools/1
    def update
      if @resource.update(tool_params)
        redirect_to @resource, notice: 'Tool was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /tools/1
    def destroy
      @resource.destroy
      redirect_to resources_url, notice: 'Tool was successfully destroyed.'
    end

    private

    # Only allow a trusted parameter "white list" through.
    def tool_params
      params.require(:resources_tool)
        .permit(:title, :intro, :video_url, :contributed_by,
          explanation_chunk_attributes: [:title, :intro, :content, :after],
          where_it_s_from_chunk_attributes: [:title, :intro, :content, :after],
          numbered_paragraph_chunk_attributes: [:title, :intro, :content, :after],
          attachments_chunk_attributes: [
            :title, 
            :intro, 
            :after,
            external_resources_attributes: [:title, :url], 
            uploaded_attachments_attributes: [:uploaded_file, :title]],
          topic_list: []
        )
    end

    def populate_tool_chunks
      @resource.build_explanation_chunk         if @resource.explanation_chunk.nil?
      @resource.build_where_it_s_from_chunk     if @resource.where_it_s_from_chunk.nil?
      @resource.build_numbered_paragraph_chunk  if @resource.numbered_paragraph_chunk.nil?

      if @resource.attachments_chunk.nil?
        @resource.build_attachments_chunk
        MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES.times do
          build_external_resources_and_attachments(@resource.attachments_chunk)
        end
      else
        populate_external_resources_and_attachments(@resource.attachments_chunk)       
      end
    end
  end
end
