class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs
  has_many :questions

  with_options presence: true do
    validates :birth_date
    validates :nickname, length: { maximum: 10 }, allow_blank: true
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々一]+\z/, message: 'is invalid. Input full-width characters' }
    validates :last_name_kana, :first_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  end
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
end
