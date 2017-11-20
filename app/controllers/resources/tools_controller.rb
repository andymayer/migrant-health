module Resources
  class ToolsController < ResourcesController

    private

    def set_resource_type
      @resource_class = Resources::Tool
      @resource_type = 'Tool'
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
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

    def populate_nested_chunks
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
