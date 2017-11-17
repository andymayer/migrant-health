module Resources
  class PracticeExamplesController < ResourcesController

    # GET /practice_examples
    def index
      @resource_type = 'Practice Example'
      @resources = PracticeExample.all
    end

    # GET /practice_examples/new
    def new
      @resource = PracticeExample.new
      populate_practice_example_chunks
    end

    # GET /practice_examples/1/edit
    def edit
      populate_practice_example_chunks
    end

    # POST /practice_examples
    def create
      @resource = PracticeExample.new(practice_example_params)

      if @resource.save
        redirect_to @resource, notice: 'Practice example was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /practice_examples/1
    def update
      if @resource.update(practice_example_params)
        redirect_to @resource, notice: 'Practice example was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /practice_examples/1
    def destroy
      @resource.destroy
      redirect_to resources_url, notice: 'Practice example was successfully destroyed.'
    end

    private

    # Only allow a trusted parameter "white list" through.
    def practice_example_params
      params.require(:resources_practice_example)
        .permit(:title, :intro, :video_url, :contributed_by,
          what_was_the_problem_chunk_attributes: [:title, :intro, :content, :after],
          how_did_we_approach_it_chunk_attributes: [:title, :intro, :content, :after],
          what_did_we_do_chunk_attributes: [:title, :intro, :content, :after],
          did_it_work_chunk_attributes: [:title, :intro, :content, :after],
          recommendations_chunk_attributes: [:title, :intro, :content, :after],
          topic_list: []
        )
    end

    def populate_practice_example_chunks
      @resource.build_what_was_the_problem_chunk    if @resource.what_was_the_problem_chunk.nil?
      @resource.build_how_did_we_approach_it_chunk  if @resource.how_did_we_approach_it_chunk.nil?
      @resource.build_what_did_we_do_chunk          if @resource.what_did_we_do_chunk.nil?
      @resource.build_did_it_work_chunk             if @resource.did_it_work_chunk.nil?
      @resource.build_recommendations_chunk         if @resource.recommendations_chunk.nil?
    end
  end
end
