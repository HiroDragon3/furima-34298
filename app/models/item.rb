class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  #空の投稿を保存できないようにする
  validates :image, :item_name, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached?
  end
  
  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end
end
