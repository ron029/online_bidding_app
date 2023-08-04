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
    @bid = current_user.bidders.build(bid_params)
    time_remaining = @bid.product.bidding_expiration.to_time - Time.now

    if @bid.bid_amount.present? && @bid.bid_amount >= @bid.product.lowest_allowable_bid && time_remaining > 0
      if @bid.save
        flash[:success] = 'Bid was successfully created.'
        redirect_to root_url
      else
        flash.now[:danger] = 'No empty'
        redirect_to product_path(params[:bid][:product_id])
      end
    else
      flash[:danger] = "Sorry, can't bid at this time"
      redirect_to product_path(params[:bid][:product_id])
    end
  end

  def update; end

  private

  def bid_params
    params.require(:bid).permit(:user_id, :product_id, :bid_amount)
  end
end
