class Delivery < ApplicationRecord
  belongs_to :customer
  def all_address
    '〒'+self.postal_code + self.address + self.destination 
  end
end
