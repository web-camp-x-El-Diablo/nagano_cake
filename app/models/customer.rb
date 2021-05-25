class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deliveries
  has_many :cart_products
  has_many :orders
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true

# 会員状態が無効だとログインできない
  def active_for_authentication?
    super && (is_deleted == false)
  end

# 会員の検索
  def self.search(column, value)
    Customer.where(Customer.sanitize_sql(["#{column} LIKE ?", "%#{value}%"]))
  end
end
