class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building_name, :tel, :user_id, :created_at, :item_id 

  with_options presence: true do
    validates :user_id
    # validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_address
    validates :tel, numericality: { only_integer: true }, length: { in: 10..11 }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, tel: tel, order_id: order.id)
  end
end