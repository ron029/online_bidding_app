class StaticPagesController < ApplicationController
  def home
    render 'dashboard_products'
  end
end
