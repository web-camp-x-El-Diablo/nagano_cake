class OrderDetail < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  enum production_status:{
    unable: 0,
    before_starting: 1,
    now_processing: 2,
    finished: 3,
  }
end
