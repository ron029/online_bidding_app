# Frozen_string_literal: true

# This module use dry princple for log in and session of a user.
module SessionsHelper
  def log_in(user)
    session[:user_name] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
