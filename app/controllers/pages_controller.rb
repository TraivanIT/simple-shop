class PagesController < ApplicationController
  def home
    @products = Product.all
    @order_item = OrderItem.new
  end
end
