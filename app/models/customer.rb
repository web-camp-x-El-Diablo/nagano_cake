class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #退会したらログイン出来なくなる記載       
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
