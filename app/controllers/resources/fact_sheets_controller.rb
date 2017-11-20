module Resources
  class FactSheetsController < ResourcesController

    private

    def set_resource_type
      @resource_class = Resources::FactSheet
      @resource_type = 'Fact Sheet'
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resources_fact_sheet)
        .permit(:title, :intro, :video_url, :contributed_by,
          numbered_paragraph_chunk_attributes: [:title, :intro, :content, :after],
          further_information_chunk_attributes: [
            :title,
            :intro,
            :after,
            external_resources_attributes: [:title, :url],
            uploaded_attachments_attributes: [:uploaded_file, :title]],
          indicators_chunk_attributes: [:title, :intro, :content, :after],
          what_to_do_chunk_attributes: [:title, :intro, :content, :after],
          topic_list: []
        )
    end

    # YUCK
    def populate_nested_chunks
      @resource.build_numbered_paragraph_chunk  if @resource.numbered_paragraph_chunk.nil?

      if @resource.further_information_chunk.nil?
        @resource.build_further_information_chunk
        MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES.times do
          build_external_resources_and_attachments(@resource.further_information_chunk)
        end
      else
        populate_external_resources_and_attachments(@resource.further_information_chunk)
      end
      @resource.build_indicators_chunk          if @resource.indicators_chunk.nil?
      @resource.build_what_to_do_chunk          if @resource.what_to_do_chunk.nil?
    end
  end
end

