class Public::ProductsController < ApplicationController
  # ユーザーがログインしないとカート内に商品を入れらないように設定
  before_action :authenticate_customer!, only: [:create]
  
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
