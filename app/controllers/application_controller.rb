class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorised

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # So devise creates the correct fields when registering a user
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :first_name, :last_name, :job_title, :institution, :location])
  end

  private

  def ajax_redirect_to(redirect_uri)
    { js: "window.location.replace('#{redirect_uri}');" }
  end

  def user_not_authorised(exception)
    logger.info ('in user not authorised')
    case exception.record
    when Question
      handle_question_answer_exception(exception.record)
    when Answer
      handle_question_answer_exception(exception.record)
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

  def handle_question_answer_exception(thing)
    if current_user && thing.user == current_user
      logger.info "You cannot vote on your own #{thing.class.name.downcase.pluralize}"
      flash[:alert] = "You cannot vote on your own #{thing.class.name.downcase.pluralize}"
    else
      logger.info "User not authorised #{thing.class.name.downcase.pluralize}"
      flash[:alert] = thing.authorisation_message
    end
  end
end
