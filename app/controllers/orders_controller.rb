class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order
  end

  def confirm
  end

  def thanks
  end

  def create
  end
end
