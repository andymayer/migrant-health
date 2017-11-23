class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy, :like, :unlike]

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
  end

  def like
    authorize @answer

    if current_user.voted_up_on? @answer
      @answer.unliked_by current_user
    else
      @answer.liked_by current_user
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js   { render layout: false }
    end
  end

  def unlike
    authorize @answer

    if current_user.voted_down_on? @answer
      @answer.undisliked_by current_user
    else
      @answer.disliked_by current_user
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to @answer.question, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'Answer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end
end
