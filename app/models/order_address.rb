class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :lot_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :item_id
  validates :user_id
  validates :token
  validates :postal_code, format: { with: /\A[0-9]{3}[-][0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :lot_number
  validates :phone_number,format: { with: /\A[0-9]{10,11}\z/, message: "input number 10"},numericality: { only_integer: true, message: "input only number" }
  
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, lot_number: lot_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end