class User < ApplicationRecord
  has_secure_password

  has_one_attached :image


  validates :email, uniqueness: true

  def admin?
    role == 'admin'
  end
end
