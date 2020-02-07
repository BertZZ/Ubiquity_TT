module AuthExceptions
  class NotSignedIn < StandardError; end

  extend ActiveSupport::Concern

  included do
    rescue_from AuthExceptions::NotSignedIn, with: :redirect_to_sign_in
  end

  def redirect_to_sign_in(_exception)
    redirect_to new_session_path
    flash[:notice] = "Please Sign In to view this page"
  end
end
