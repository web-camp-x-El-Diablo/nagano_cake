class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum order_status:{
    waiting_for_payment: 0,
    confirm_payment: 1,
    processing: 2,
    preparering_delivery: 3,
    delivered: 4
  }

  enum payment_method:{
    credit: 0,
    cash: 1
  }
end
