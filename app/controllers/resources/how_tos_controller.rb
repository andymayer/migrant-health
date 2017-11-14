class Resources::HowTosController < ApplicationController
  before_action :set_how_to, only: [:show, :edit, :update, :destroy]

  # GET /how_tos
  def index
    @resource_type = 'How To'
    @how_tos = HowTo.all
  end

  # GET /how_tos/1
  def show
  end

  # GET /how_tos/new
  def new
    @how_to = HowTo.new
    populate_how_to_chunks
  end

  # GET /how_tos/1/edit
  def edit
    populate_how_to_chunks
  end

  # POST /how_tos
  def create
    @how_to = HowTo.new(how_to_params)
    if @how_to.save
      redirect_to [:resources, @how_to], notice: 'How to was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /how_tos/1
  def update
    if @how_to.update(how_to_params)
      redirect_to [:resources, @how_to], notice: 'How to was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /how_tos/1
  def destroy
    @how_to.destroy
    redirect_to resources_path, notice: 'How to was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_how_to
      @how_to = HowTo.find_by_slug(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def how_to_params
      params.require(:how_to)
        .permit(:title, :intro,
          before_in_preparation_chunk_attributes: [:title, :intro, :content, :after],
          during_consultation_chunk_attributes: [:title, :intro, :content, :after],
          after_aftercare_chunk_attributes: [:title, :intro, :content, :after],
          indicators_chunk_attributes: [:title, :intro, :content, :after],
          what_to_do_chunk_attributes: [:title, :intro, :content, :after],
          consider_relevant_chunk_attributes: [:title, :intro, :content, :after],
          symptoms_reported_chunk_attributes: [:title, :intro, :content, :after],
        )
    end

    # YUCK
    def populate_how_to_chunks
      @how_to.build_before_in_preparation_chunk if @how_to.before_in_preparation_chunk.nil?
      @how_to.build_during_consultation_chunk   if @how_to.during_consultation_chunk.nil?
      @how_to.build_after_aftercare_chunk       if @how_to.after_aftercare_chunk.nil?
      @how_to.build_indicators_chunk            if @how_to.indicators_chunk.nil?
      @how_to.build_what_to_do_chunk            if @how_to.what_to_do_chunk.nil?
      @how_to.build_consider_relevant_chunk     if @how_to.consider_relevant_chunk.nil?
      @how_to.build_symptoms_reported_chunk     if @how_to.symptoms_reported_chunk.nil?
    end
end
