module Resources
  class BrightIdeasController < ResourcesController

    private

    def set_resource_type
      @resource_class = Resources::BrightIdea
      @resource_type = 'Bright ideas'
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resources_bright_idea)
        .permit(:title, :intro, :video_url, :contributed_by,
          what_was_the_problem_chunk_attributes: [:title, :intro, :content, :after],
          how_did_we_approach_it_chunk_attributes: [:title, :intro, :content, :after],
          what_did_we_do_chunk_attributes: [:title, :intro, :content, :after],
          did_it_work_chunk_attributes: [:title, :intro, :content, :after],
          recommendations_chunk_attributes: [:title, :intro, :content, :after],
          attachments_chunk_attributes: [
            :title,
            :intro,
            :after,
            external_resources_attributes: [:title, :url],
            uploaded_attachments_attributes: [:uploaded_file, :title, :delete_uploaded_file]],
          topic_list: []
        ).reject{|_, v| v.blank?}
    end

    def populate_nested_chunks
      @resource.build_what_was_the_problem_chunk    if @resource.what_was_the_problem_chunk.nil?
      @resource.build_how_did_we_approach_it_chunk  if @resource.how_did_we_approach_it_chunk.nil?
      @resource.build_what_did_we_do_chunk          if @resource.what_did_we_do_chunk.nil?
      @resource.build_did_it_work_chunk             if @resource.did_it_work_chunk.nil?
      @resource.build_recommendations_chunk         if @resource.recommendations_chunk.nil?
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
