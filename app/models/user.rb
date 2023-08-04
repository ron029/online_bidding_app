# Frozen_string_literal: true

# This class represent the User model of the app.
class User < ApplicationRecord
  has_many :bidders
  has_many :products

  before_save { self.email_address = email_address.downcase }
  before_save :update_is_an_admin_new

  regex_email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  VALID_EMAIL_REGEX = regex_email.freeze

  validates :name, presence: true
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password

  private

  def update_is_an_admin_new
    if User.count == 0
      self.is_an_admin_new = "1"
    else
      self.is_an_admin_new = "0"
    end
  end
end
