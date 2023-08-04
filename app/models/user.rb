# Frozen_string_literal: true

# This class represent the User model of the app.
class User < ApplicationRecord
  has_many :bidders
  has_many :products

  before_save { self.email_address = email_address.downcase }

  regex_email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  VALID_EMAIL_REGEX = regex_email.freeze

  validates :name, presence: true
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  attribute :is_an_admin_new, :boolean
  has_secure_password
end
