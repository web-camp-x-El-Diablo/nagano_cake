class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}, _prefix: true
  enum payment_method:{ クレジットカード: 0, 銀行振込: 1 }
end
