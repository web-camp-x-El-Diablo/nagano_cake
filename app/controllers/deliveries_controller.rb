class DeliveriesController < ApplicationController
  def index
    @deriveries = current_customer.deriveries
  	@deriveries = Deriveries.new
  end

  def edit
  end

  def create
  end
  
  def update
  end
 
  def destroy
  end
end
