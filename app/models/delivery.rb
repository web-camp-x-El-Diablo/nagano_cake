class Delivery < ApplicationRecord
  belongs_to :customer
  def all_address
    '〒'+self.postal_code + self.address + self.destination
  end
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :destination, presence: true


end

