class Resources::FactSheetsController < ApplicationController
  before_action :set_fact_sheet, only: [:show, :edit, :update, :destroy]

  MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES = 6

  # GET /fact_sheets
  def index
    @resource_type = 'Fact Sheet'
    @fact_sheets = FactSheet.all
  end

  # GET /fact_sheets/1
  def show
  end

  # GET /fact_sheets/new
  def new
    @fact_sheet = FactSheet.new
    populate_fact_sheet_chunks
  end

  # GET /fact_sheets/1/edit
  def edit
    populate_fact_sheet_chunks
  end

  # POST /fact_sheets
  def create
    @fact_sheet = FactSheet.new(fact_sheet_params)

    if @fact_sheet.save
      redirect_to [:resources, @fact_sheet], notice: 'Fact sheet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fact_sheets/1
  def update
    if @fact_sheet.update(fact_sheet_params)
      redirect_to [:resources, @fact_sheet], notice: 'Fact sheet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fact_sheets/1
  def destroy
    @fact_sheet.destroy
    redirect_to resources_path, notice: 'Fact sheet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact_sheet
      @fact_sheet = FactSheet.find_by_slug(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fact_sheet_params
      params.require(:fact_sheet)
        .permit(:title, :intro,
          numbered_paragraph_chunk_attributes: [:title, :intro, :content, :after],
          further_information_chunk_attributes: [:title, :intro, :after,
          external_resources_attributes: [:title, :url]],
          indicators_chunk_attributes: [:title, :intro, :content, :after],
          what_to_do_chunk_attributes: [:title, :intro, :content, :after],
        )
    end

    # YUCK
    def populate_fact_sheet_chunks
      @fact_sheet.build_numbered_paragraph_chunk  if @fact_sheet.numbered_paragraph_chunk.nil?

      if @fact_sheet.further_information_chunk.nil?
        @fact_sheet.build_further_information_chunk
        MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES.times do
          @fact_sheet.further_information_chunk.external_resources.build
        end
      else
        number_of_external_resources = @fact_sheet.further_information_chunk.external_resources.count
        if number_of_external_resources < MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES
          (MAXIMUM_NUMBER_OF_EXTERNAL_RESOURCES - number_of_external_resources).times do
             @fact_sheet.further_information_chunk.external_resources.build
          end
        end
      end
      @fact_sheet.build_indicators_chunk          if @fact_sheet.indicators_chunk.nil?
      @fact_sheet.build_what_to_do_chunk          if @fact_sheet.what_to_do_chunk.nil?
    end
end

