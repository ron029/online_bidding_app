# Frozen_string_literal: true

# This class represent the Bids of users in the app.
class BidsController < ApplicationController
  before_action :an_admin, only: %i[stop_bid]
  def new; end
  
  def show; end

  def stop_bid
    deactivate_bid(params[:id])
    flash[:success] = 'Product has been archieve'
    redirect_to root_url
  end

  def show_bid
    @product = Product.find(params[:id])
    @bidders = @product.bidders.includes(:user)
    render :show
  end

  def show_all_bid
    @bidders = Bidder.includes(:user, :product)
    render 'show_all_bid'
  end

  def create
    @bid = Bidder.new(bid_params)
    if @bid.save
      flash[:success] = 'You bid has been recorded.'
      redirect_to root_url
    else
      flash.now[:danger] = 'Theres an error in you bid'
    end
  end

  def update; end

  private

  def bid_params
    params.require(:bid).permit(:user_id, :product_id, :bid_amount)
  end
end
