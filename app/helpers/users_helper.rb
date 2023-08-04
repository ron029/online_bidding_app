# Frozen_string_literal: true

# User helper module
module UsersHelper
  def welcome_message(user_name)
    user_name = camelcase(user_name)
    excitement_phrases = [
      "Welcome back, #{user_name}! Let's start bidding and winning!",
      "Hey there, #{user_name}! Get ready to outbid the competition!",
      "Congratulations, #{user_name}! Your bids are going to make a splash!",
      "Hi, #{user_name}! The excitement is about to begin. Happy bidding!",
      "Welcome, #{user_name}! Prepare for heart-pounding bidding action!",
      "Hello, #{user_name}! Time to win big with your bids!"
    ]
    excitement_phrases.sample
  end

  def camelcase(user_name)
    user_name.split.map(&:capitalize).join(' ')
  end

  def admin?(user)
    return false unless current_user

    user.is_an_admin_new.to_i > 0
  end

  def an_admin
    admin?(current_user)
  end

  def not_admin
    !admin?(current_user)
  end
end
