class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :item_prefecture_id, :municipality, :address, :building_name, :phone_number,
                :order, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :item_prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true },
                             format: { with: /\A\d{11}\z/, message: 'is invalid. Only numbers within 11 numbers' }
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :item_prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, municipality: municipality,
                   address: address, building_name: building_name, phone_number: phone_number, order: order)
  end
end
