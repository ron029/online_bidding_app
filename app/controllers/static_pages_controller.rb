class StaticPagesController < ApplicationController
  def home
    @user = User.new
    render 'dashboard_products'
  end
end
