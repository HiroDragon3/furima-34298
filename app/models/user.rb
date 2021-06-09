class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email,               uniqueness: true
    validates :password,            length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # Passwordが英数字混合の正規表現
    validates :last_name,           format: { with: /\A[ぁ-んァ-ン一-龥]/ } # ユーザー本名全角の正規表現
    validates :first_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana,      format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
    validates :first_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end
