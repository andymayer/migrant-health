module Resources
  class HowTosController < ResourcesController

    # GET /how_tos
    def index
      @resource_type = 'How To'
      @resources = HowTo.all
    end

    # GET /how_tos/new
    def new
      @resource = HowTo.new
      populate_how_to_chunks
    end

    # GET /how_tos/1/edit
    def edit
      populate_how_to_chunks
    end

    # POST /how_tos
    def create
      @resource = HowTo.new(how_to_params)
      if @resource.save
        redirect_to @resource, notice: 'How to was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /how_tos/1
    def update
      if @resource.update(how_to_params)
        redirect_to @resource, notice: 'How to was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /how_tos/1
    def destroy
      @resource.destroy
      redirect_to resources_path, notice: 'How to was successfully destroyed.'
    end

    private

    # Only allow a trusted parameter "white list" through.
    def how_to_params
      params.require(:resources_how_to)
        .permit(:title, :intro, :video_url, :contributed_by,
          before_in_preparation_chunk_attributes: [:title, :intro, :content, :after],
          during_consultation_chunk_attributes: [:title, :intro, :content, :after],
          after_aftercare_chunk_attributes: [:title, :intro, :content, :after],
          indicators_chunk_attributes: [:title, :intro, :content, :after],
          what_to_do_chunk_attributes: [:title, :intro, :content, :after],
          consider_relevant_chunk_attributes: [:title, :intro, :content, :after],
          symptoms_reported_chunk_attributes: [:title, :intro, :content, :after],
          resources_chunk_attributes: [
            :title, 
            :intro, 
            :after,
            external_resources_attributes: [:title, :url], 
            uploaded_attachments_attributes: [:uploaded_file, :title]],
          topic_list: []
        )
    end

    # YUCK
    def populate_how_to_chunks
      @resource.build_before_in_preparation_chunk if @resource.before_in_preparation_chunk.nil?
      @resource.build_during_consultation_chunk   if @resource.during_consultation_chunk.nil?
      @resource.build_after_aftercare_chunk       if @resource.after_aftercare_chunk.nil?
      @resource.build_indicators_chunk            if @resource.indicators_chunk.nil?
      @resource.build_what_to_do_chunk            if @resource.what_to_do_chunk.nil?
      @resource.build_consider_relevant_chunk     if @resource.consider_relevant_chunk.nil?
      @resource.build_symptoms_reported_chunk     if @resource.symptoms_reported_chunk.nil?
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
