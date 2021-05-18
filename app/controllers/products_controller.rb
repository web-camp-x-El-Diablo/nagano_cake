class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
  end
end
