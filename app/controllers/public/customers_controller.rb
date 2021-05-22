class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = Customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to products_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :postal_code, :address, :telephone_number, :first_name_kana, :email, :is_deleted)
  end

end
