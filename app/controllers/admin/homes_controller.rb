class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  # 管理者top（注文一覧）画面の表示
  def top
    @orders = Order.page(params[:page]).reverse_order
  end
end
