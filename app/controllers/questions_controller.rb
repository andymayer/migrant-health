class QuestionsController < ApplicationController
  include VotingConcern

  before_action :set_question,  only: [:show, :edit, :update, :destroy]
  before_action :set_topics,    only: [:edit, :new, :create, :update]
  before_action :set_votable, only: [:like, :unlike]   
  before_action :authorise,   only: [:like, :unlike]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    if @question.topic_list.any?
      @topics = @question.topics
    else
      @topics = ActsAsTaggableOn::Tag.order("RANDOM()").limit(4)
    end
    @answer = Answer.new(question: @question)
    @comment = Comment.new()
  end

  # GET /questions/new
  def new
    @question = Question.new
    authorize @question
  end

  # GET /questions/1/edit
  def edit
    authorize @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    authorize @question
    @question.user = current_user

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    authorize @question
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    authorize @question
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find_by_slug(params[:id])
  end

  def set_topics
    @topics = ActsAsTaggableOn::Tag.all
  end

  def set_votable
    @votable = @question
  end

  def authorise
    authorize @question
  end

  # Only allow a trusted parameter "white list" through.
  def question_params
    params.require(:question).permit(:content, topic_list: [])
  end
end
