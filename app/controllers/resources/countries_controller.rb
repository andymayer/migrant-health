module Resources
  class CountriesController < ResourcesController

    # GET /countries
    def index
      @resource_type = 'Country'
      @resources = Country.all
    end

    # GET /countries/1
    def show
    end

    # GET /countries/new
    def new
      @resource = Country.new
      populate_country_chunks
    end

    # GET /countries/1/edit
    def edit
      populate_country_chunks
    end

    # POST /countries
    def create
      @resource = Country.new(country_params)

      if @resource.save
        redirect_to @resource, notice: 'Country was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /countries/1
    def update
      if @resource.update(country_params)
        redirect_to @resource, notice: 'Country was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /countries/1
    def destroy
      @resource.destroy
      redirect_to countries_url, notice: 'Country was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @resource = Country.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:resources_country)
        .permit(:title, :intro, :video_url, :contributed_by,
          resources_chunk_attributes: [
            :title, 
            :intro, 
            :after,
            external_resources_attributes: [:title, :url], 
            uploaded_attachments_attributes: [:uploaded_file, :title]],
          topic_list: []
        )
    end

    def populate_country_chunks

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
