class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :managements
  with_options presence: true do
    zen = /\A[ぁ-んァ-ン一-龥]/
    kana = /\A[ァ-ヶー－]+\z/
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :nickname
    validates :date
    validates :name, format: { with: zen, message: 'is invalid. Input full-width characters.' }
    validates :family_name, format: { with: zen, message: 'is invalid. Input full-width characters.' }
    validates :name_read, format: { with: kana, message: 'is invalid. Input full-width katakana characters.' }
    validates :family_name_read, format: { with: kana, message: 'is invalid. Input full-width katakana characters.' }
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
