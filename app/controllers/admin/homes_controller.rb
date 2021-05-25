class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  # 管理者top（注文一覧）画面の表示
  def top
    @orders = Order.page(params[:page]).reverse_order
  end

  # 検索
  def search
    @orders = Order.where(customer_id: params[:format]).order(" created_at DISC").page(params[:page]).per(10)
    render 'top'
  end
end
