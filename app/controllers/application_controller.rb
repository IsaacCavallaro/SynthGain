class ApplicationController < ActionController::Base
  helper_method :current_profile, :profile_complete?

  private

  def current_profile
    return unless current_user

    @current_profile ||= current_user.user_info
  end

  def profile_complete?
    current_profile.present?
  end
end
