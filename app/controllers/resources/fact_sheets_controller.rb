module Resources
  class FactSheetsController < ResourcesController
    before_action :set_fact_sheet, only: [:show, :edit, :update, :destroy]

    # GET /fact_sheets
    def index
      @resource_type = 'Fact Sheet'
      @resources = FactSheet.all
    end

    # GET /fact_sheets/1
    def show
    end

    # GET /fact_sheets/new
    def new
      @resource = FactSheet.new
      populate_fact_sheet_chunks
    end

    # GET /fact_sheets/1/edit
    def edit
      populate_fact_sheet_chunks
    end

    # POST /fact_sheets
    def create
      @resource = FactSheet.new(fact_sheet_params)

      if @resource.save
        redirect_to @resource, notice: 'Fact sheet was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /fact_sheets/1
    def update

      if @resource.update(fact_sheet_params)
        redirect_to @resource, notice: 'Fact sheet was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /fact_sheets/1
    def destroy
      @resource.destroy
      redirect_to resources_path, notice: 'Fact sheet was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_fact_sheet
      @resource = FactSheet.find_by_slug(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fact_sheet_params
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
    def populate_fact_sheet_chunks
      @resource.build_numbered_paragraph_chunk  if @resource.numbered_paragraph_chunk.nil?

      if @resource.further_information_chunk.nil?
        @resource.build_further_information_chunk
        MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES.times do
          @resource.further_information_chunk.external_resources.build
          @resource.further_information_chunk.uploaded_attachments.build
        end
      else
        number_of_external_resources = @resource.further_information_chunk.external_resources.count
        if number_of_external_resources < MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES
          (MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES - number_of_external_resources).times do
             @resource.further_information_chunk.external_resources.build
          end
        end
        number_of_uploaded_attachments = @resource.further_information_chunk.uploaded_attachments.count
        if number_of_uploaded_attachments < MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES
          (MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES - number_of_uploaded_attachments).times do
             @resource.further_information_chunk.uploaded_attachments.build
          end
        end
      end
      @resource.build_indicators_chunk          if @resource.indicators_chunk.nil?
      @resource.build_what_to_do_chunk          if @resource.what_to_do_chunk.nil?
    end
  end
end

