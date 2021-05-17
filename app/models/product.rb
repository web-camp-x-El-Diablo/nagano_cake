class Product < ApplicationRecord
  # 商品のアソシエーション
  has_many :genres
end
