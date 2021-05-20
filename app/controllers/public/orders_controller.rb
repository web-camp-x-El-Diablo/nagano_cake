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
    @order = Order.new
      if params[:order][:address_opition] == 0
       @order.delivery_address = current_customer.address
       @order.delivery_name = current_customer.name
       @order.delivery_postal_code = current_customer.postal_code
      elsif params[:order][:address_opition] == 1
       @order.delivery_id = current_customer.deliveries
      elsif params[:order][:address_opition] == 2
       @order.delivery_address = current_customer.address
       @order.delivery_postal_code = current_customer.postal_code
       
       @order.save
      end
    redirect_to orders_confirm_path
  end

  def thanks
  end

  def create
  end
end
