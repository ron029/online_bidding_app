# Frozen_string_literal: true

# This class represent the main controller of the app.
class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper
  include BidsHelper
end
