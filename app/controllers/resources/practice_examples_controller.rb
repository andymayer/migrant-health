class Resources::PracticeExamplesController < ApplicationController
  before_action :set_practice_example, only: [:show, :edit, :update, :destroy]

  # GET /practice_examples
  def index
    @resource_type = 'Practice Example'
    @practice_examples = PracticeExample.all
  end

  # GET /practice_examples/1
  def show
  end

  # GET /practice_examples/new
  def new
    @practice_example = PracticeExample.new
    populate_practice_example_chunks
  end

  # GET /practice_examples/1/edit
  def edit
    populate_practice_example_chunks
  end

  # POST /practice_examples
  def create
    @practice_example = PracticeExample.new(practice_example_params)

    if @practice_example.save
      redirect_to [:resources, @practice_example], notice: 'Practice example was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /practice_examples/1
  def update
    if @practice_example.update(practice_example_params)
      redirect_to [:resources, @practice_example], notice: 'Practice example was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /practice_examples/1
  def destroy
    @practice_example.destroy
    redirect_to resources_url, notice: 'Practice example was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice_example
      @practice_example = PracticeExample.find_by_slug(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def practice_example_params
      params.require(:practice_example)
        .permit(:title, :intro,
          what_was_the_problem_chunk_attributes: [:title, :intro, :content, :after],
          how_did_we_approach_it_chunk_attributes: [:title, :intro, :content, :after],
          what_did_we_do_chunk_attributes: [:title, :intro, :content, :after],
          did_it_work_chunk_attributes: [:title, :intro, :content, :after],
          recommendations_chunk_attributes: [:title, :intro, :content, :after],
        )
    end

    def populate_practice_example_chunks
      @practice_example.build_what_was_the_problem_chunk    if @practice_example.what_was_the_problem_chunk.nil?
      @practice_example.builf_how_did_we_approach_it_chunk  if @practice_example.how_did_we_approach_it_chunk.nil?
      @practice_example.build_what_did_we_do_chunk          if @practice_example.what_did_we_do_chunk.nil?
      @practice_example.build_did_it_work_chunk             if @practice_example.did_it_work_chunk.nil?
      @practice_example.build_recommendations_chunk         if @practice_example.recommendations_chunk.nil?
    end
end
