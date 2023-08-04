# Frozen_string_literal: true

# This class represent the static pages or dashboard of the app
class StaticPagesController < ApplicationController
  # before_action :an_admin, only: %i[stop_bid]

  def home
    @bids = products_with_bids if current_user
    @products = Product.where(status: 'active').paginate(page: params[:page], per_page: 12)
    @user = User.new
  end

  def products_with_bids
    product_ids_with_bids = current_user.bidders.pluck(:product_id).uniq
    Product.where(id: product_ids_with_bids)
  end
end
