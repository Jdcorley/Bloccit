class ApplicationController < ActionController::Base

  include SessionsHelper

  private

  def require_sign_in
    unless current_user
      flash[:alert] = 'You must be logged in to do that'

      redirect_to new_session_path
    end
  end
end
