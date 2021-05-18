class Admin::ProductsController < ApplicationController
  # 商品のコントローラー
  def index
    
    @products = Product.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :image, :name, :introduction, :price, :sales_status)
  end

end
