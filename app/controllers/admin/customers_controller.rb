class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  # customerの検索

  def search
    value = params[:vaule_customer]
    column = params[:column_customer]
    @customers = Customer.search(column, value).page(params[:page]).per(10)
    render 'index'
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :postal_code, :address, :telephone_number, :first_name_kana, :email, :is_deleted)
  end
end
