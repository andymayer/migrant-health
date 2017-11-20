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

  def user_not_authorised
    flash[:alert] = "You are not authorised to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
