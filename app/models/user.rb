class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :email,               presence: true, uniqueness: true
  validates :password,  presence: true, length: { minimum: 6 }, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name,           presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
  validates :first_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,      presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :first_name_kana,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date,          presence: true
end
