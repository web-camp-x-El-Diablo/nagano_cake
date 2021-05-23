class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  # カスタマー側の注文履歴一覧ページ
  def index
    @orders = current_customer.orders.order(created_at: "DESC")
    @delivery_fee = 800
  end

  # カスタマー側の注文履歴詳細ページ
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @delivery_fee = 800
    @sum = 0
    @order_details.each do |order_detail|
      @sum += (order_detail.subtotal * 1.1 * order_detail.amount).floor
    end
  end

  # 注文情報入力画面
  def new
    @order = Order.new
  end

  # 注文情報確認画面
  def confirm
    @order = current_customer.orders.build(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @delivery_fee = 800
    @order.payment_method = params[:order][:payment_method]
  # ご自身の住所
    if params[:order][:address_opition] == "0"
        @order.delivery_address = current_customer.address
        @order.delivery_name = current_customer.last_name + current_customer.first_name
        @order.delivery_postal_code = current_customer.postal_code
  # 登録済みの住所
    elsif params[:order][:address_opition] == "1"
      delivery = Delivery.find(params[:order][:delivery_id])
        @order.delivery_postal_code = delivery.postal_code
        @order.delivery_address = delivery.address
        @order.delivery_name = delivery.destination
  # 新しい配送先 
    elsif params[:order][:address_option] == "2"
      @order.order_postal_code = params[:order][:order_postal_code]
      @order.order_address = params[:order][:order_address]
      @order.order_name = params[:order][:order_name]
    end
    unless @order.valid?
      flash.now[:danger] = "お届け先の内容に不備があります"
      render :new
    end
  end

  # thanksページ
  def thanks
  end

  # 注文情報を作成する
  def create
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
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
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :delivery_postal_code, :delivery_address, :delivery_name, :total_payment, :delivery_fee)
  end
end
