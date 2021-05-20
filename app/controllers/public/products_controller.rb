class Public::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to "/cart_products"
  end
end
