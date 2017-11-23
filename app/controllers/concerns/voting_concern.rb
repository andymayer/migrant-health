module VotingConcern
  extend ActiveSupport::Concern

  def like
    if current_user.voted_up_on? @votable
      @votable.unliked_by current_user
    else
      @votable.liked_by current_user
    end

    respond_to_voting
  end

  def unlike
    if current_user.voted_down_on? @votable
      @votable.undisliked_by current_user
    else
      @votable.disliked_by current_user
    end

    respond_to_voting
  end

  private

  def authorise
    authorize @votable
  end

  def respond_to_voting
    respond_to do |format|
      format.html { redirect_to :back }
      format.js   { render      layout: false }
    end
  end

end