# Frozen_string_literal: true

# This class represent the products of the app.
class ProductsController < ApplicationController
  # before_action :an_admin, only: %i[stop_bid]
  before_action :force_login, only: %i[show]

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'New Product save'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :lowest_allowable_bid, :starting_bid_price, :bidding_expiration)
  end
end
