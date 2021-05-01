class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buyers
  
with_options presence: true do
 # presence:trueのみ適用されるカラムを書き出す
validates :nickname
validates :born

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    # 「presence:true」かつ「正規表現が適用される」カラムを書き出す
    validates :password
    validates :password_confirmation
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_read
    validates :last_name_read
  end
end
end
