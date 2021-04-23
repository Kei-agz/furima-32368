class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buyers

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, :last_name, format: { with:  VALID_NAME_REGEX }

  VALID_NAME_READ_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_name_read, :last_name_read, format: { with:  VALID_NAME_READ_REGEX }
  
  validates :nickname, :first_name_read, :last_name_read, :born, presence: true
end
