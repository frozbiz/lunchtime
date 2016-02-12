class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_user_time_zone

protected

  def set_user_time_zone
    if current_user
      Time.zone = ActiveSupport::TimeZone.new(current_user.office.tz)
    else
      Time.zone = ActiveSupport::TimeZone.new(Office.find(1).tz)
    end
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end
end
