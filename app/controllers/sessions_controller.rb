# Frozen_string_literal: true

# This class represent the Session of a User in the app.
class SessionsController < ApplicationController
  before_action :force_root, only: %i[new]
  def new; end

  def create
    user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = welcome_message(user.name)
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
