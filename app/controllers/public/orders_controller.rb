class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order
    @order = Order.new

  end

  def confirm
    @order = current_customer.orders.build(order_params)
    @cart_products = current_customer.cart_products
     if params[:order][:address_opition] == "0"
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
      @order.delivery_postal_code = current_customer.postal_code
    
     end
  end

  def thanks
  end

  def create
  end

  def order_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name)
  end
end
