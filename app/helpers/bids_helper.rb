module BidsHelper
  def deactivate_bid(product)
    product = Product.find(product)
    product.update_attribute('status', 'sold')
  end

  def bid_greather_than_lowest(bid_amount, lowest_amount)
    lowest_amount = BigDecimal(lowest_amount)
    bid_amount = BigDecimal(bid_amount)
    !(lowest_amount > bid_amount)
    #   flash.now[:danger] = 'asdfasdfas'
    #   false
    # end
    # true
  end

  def show_bid(product)
    product = Product.find(product)
  end
end
