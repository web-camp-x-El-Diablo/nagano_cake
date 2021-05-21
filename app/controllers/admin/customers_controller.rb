class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
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

    private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :postal_code, :address, :telephone_number, :first_name_kana, :email, :is_deleted)
  end
end
