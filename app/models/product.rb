class Product < ApplicationRecord
  # 商品のアソシエーション
  belongs_to :genre
  # 商品の画像投稿
  attachment :image, destroy: false
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end
