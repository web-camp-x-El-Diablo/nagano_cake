class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  # 対象の注文を取得
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  # 製作ステータスとの紐づけ
  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)

    @order_detail = @order.order_details.each do |order_detail|
      if @order.order_status == "入金確認"
        order_detail.production_status = "製作待ち"
        order_detail.save
        @order.save
      elsif order_detail.production_status == "製作中"
        @order.order_status = "製作中"
        order_detail.save
        @order.save
      elsif order_detail.production_status == "製作完了"
        @order.order_status = "発送準備中"
        order_detail.save
        @order.save
      end
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_status_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
