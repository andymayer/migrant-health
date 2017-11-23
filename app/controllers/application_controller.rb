class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorised

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # So devise creates the correct fields when registering a user
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :first_name, :last_name])
  end

  private

  def ajax_redirect_to(redirect_uri)
    { js: "window.location.replace('#{redirect_uri}');" }
  end

  # YUCK = this should be refactored
  def user_not_authorised(exception)
    logger.info ('in user not authorised')
    case exception.record

      when Question
              logger.info ('a question')
        handle_question_exception(exception.record)
      when Answer
          logger.info ('a answer')
        handle_answer_exception(exception.record)
      else

        logger.info "User not authorised"
        flash[:alert] = "You are not authorised to perform this action."
    end

    redirect_to_path = request.referrer || root_path
    
    # If voting, for example, you are sending a JS request via ajax
    respond_to do |format|
       format.js { render ajax_redirect_to redirect_to_path }
       format.html { redirect_to redirect_to_path }
    end
  end

  def handle_question_exception(question)
    if current_user && question.user == current_user
      logger.info "You cannot vote on your own questions"
      flash[:alert] = "You cannot vote on your own questions"
    else
      logger.info "User not authorised question"
      flash[:alert] = "You need to be logged in to ask or vote for a question."
    end
  end

  def handle_answer_exception(answer)
    if current_user && answer.user == current_user
      logger.info "You cannot vote on your own answers"
      flash[:alert] = "You cannot vote on your own answers"
    else
      logger.info "User not authorised answer"
      flash[:alert] = "You need to be logged in vote on answers."
    end
  end
end
