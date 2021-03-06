class Admin::ProductsController < ApplicationController
  # 管理者側のログインを管理
   before_action :authenticate_admin!
  # 商品のコントローラー
  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
    @genre = Genre.find(@product.genre_id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to admin_product_path(@product.id)
  else
    render "edit"
  end

  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :image, :name, :introduction, :price, :sales_status)
  end

end
