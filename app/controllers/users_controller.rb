# Frozen_string_literal: true

# This class represent the User controller of the app.
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the ChatGenie [Internship]'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end
end
