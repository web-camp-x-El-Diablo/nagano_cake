class HomesController < ApplicationController
  def top
    @products = Product.page(params[:page]).reverse_order.per(4)
  end

  def about
  end
end
