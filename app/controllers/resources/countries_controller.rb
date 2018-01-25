module Resources
  class CountriesController < ResourcesController

    private

    def set_resource_type
      @resource_class = Resources::Country
      @resource_type = 'Country'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @resource = Country.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resources_country)
        .permit(:title, :intro, :video_url, :contributed_by,
          resources_chunk_attributes: [
            :title,
            :intro,
            :after,
            external_resources_attributes: [:title, :url],
            uploaded_attachments_attributes: [:uploaded_file, :title, :delete_uploaded_file]],
          topic_list: []
        )
    end

    def populate_nested_chunks
      if @resource.resources_chunk.nil?
        @resource.build_resources_chunk
        MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES.times do
          build_external_resources_and_attachments(@resource.resources_chunk)
        end
      else
        populate_external_resources_and_attachments(@resource.resources_chunk)
      end
    end
  end
end
