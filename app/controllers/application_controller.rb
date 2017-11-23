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
    if exception.record.is_a? Question
      if current_user && exception.record.user == current_user
        logger.info "You cannot vote on your own questions"
        flash[:alert] = "You cannot vote on your own questions"
      else
        logger.info "User not authorised question"
        flash[:alert] = "You need to be logged in to ask or vote for a question."
      end
    elsif exception.record.is_a? Answer
      if current_user && exception.record.user == current_user
        logger.info "You cannot vote on your own answers"
        flash[:alert] = "You cannot vote on your own answers"
      else
        logger.info "User not authorised answer"
        flash[:alert] = "You need to be logged in vote on answers."
      end
    else
      logger.info "User not authorised"
      flash[:alert] = "You are not authorised to perform this action."
    end

    # If voting, for example, you are sending a JS request via ajax
    respond_to do |format|
       format.js { render ajax_redirect_to(request.referrer || root_path) }
       format.html { redirect_to (request.referrer || root_path) }
    end
  end
end
