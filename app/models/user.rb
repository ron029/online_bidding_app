# Frozen_string_literal: true

# This class represent the User model of the app.
class User < ApplicationRecord
  regex_email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  VALID_EMAIL_REGEX = regex_email.freeze

  validates :name, presence: true
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
end
