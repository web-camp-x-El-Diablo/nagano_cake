class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders.build(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @delivery_fee = 800
    if params[:order][:address_opition] == "0"
        @order.delivery_address = current_customer.address
        @order.delivery_name = current_customer.last_name + current_customer.first_name
        @order.delivery_postal_code = current_customer.postal_code
    elsif params[:order][:address_option] == "1"
      current_customer.delivery_addresses.each do |delivery_address|
        @order.delivery_postal_code = delivery_address.delivery.postal_code
        @order.delivery_address = delivery_address.delivery.address
        @order.delivery_name = delivery_address.delivery.name
      end
    elsif params[:order][:address_option] == "2"
      @order.order_postal_code = params[:order][:order_postal_code]
      @order.order_address = params[:order][:order_address]
      @order.order_name = params[:order][:order_name]
    end

    if @order.save
    else
      render :new
    end
  end

  def thanks
  end

  def create
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_products.each do |cart_product|
      @order_details = OrderDetail.new
      @order_details.product_id = cart_product.product_id
      @order_details.amount = cart_product.amount
      @order_details.subtotal = (cart_product.product.price * 1.1).floor
      @order_details.order_id = @order.id
      @order_details.save
    end
    @cart_products.destroy_all
    redirect_to orders_thanks_path
  end

  def order_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name, :total_payment, :delivery_fee)
  end
end
