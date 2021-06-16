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
  validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :item_category_id, numericality: { other_than: 1 } 
  validates :item_sales_status_id, numericality: { other_than: 1 } 
  validates :item_shipping_fee_id, numericality: { other_than: 1 } 
  validates :item_prefecture_id, numericality: { other_than: 1 } 
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 } 

end
