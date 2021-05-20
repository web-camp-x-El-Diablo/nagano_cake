class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order
  end

  def confirm
    @order = current_customer.orders.build(order_params)
    @cart_products = current_customer.cart_products
    @delivery_fee = "800"
    @order.save
    redirect_to orders_thanks
  end

  def thanks
  end

  def create
  end
end
