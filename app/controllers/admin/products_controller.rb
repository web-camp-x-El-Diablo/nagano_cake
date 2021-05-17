class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end
end
