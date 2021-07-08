class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # Passwordが英数字混合の正規表現
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do # ユーザー本名全角の正規表現
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do # フリガナ全角の正規表現
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birth_date
  end
end
