class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}, _prefix: true
  enum payment_method:{ クレジットカード: 0, 銀行振込: 1 }

  validate :add_error_sample

# 新しい住所が空白だった場合のエラーメッセージ
  def add_error_sample
    if delivery_name.blank?
      errors[:base] << "名前を入力してください"
    end
    if delivery_address.blank?
      errors[:base] << "住所を入力してください"
    end
    if delivery_postal_code.blank?
      errors[:base] << "郵便番号を入力してください"
    end
  end
end
