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
    @order_details = @order.order_details
    @order.update(order_status_params)

    if @order.order_status == "入金確認"
      @order_details.update(production_status: 1)
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
