class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#relationship


#validation
  validates :name, :email, :password, :phone, presence: true
  validates :email, format: { with: EMAIL_REGEX}
  validates :phone, length: { maximum: 8, message: 'Too long'}
  validates :chk_box, acceptance: true
  validates :password, length: { minimum: 5, message: 'Too short'}
  validates :email, uniqueness: {case_sensitive: true}
  has_secure_password
end
