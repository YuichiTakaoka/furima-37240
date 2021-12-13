class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, presence: true, format: {with:VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers"}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters"}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters"}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"}
  validates :birthday_year, presence: true
end
