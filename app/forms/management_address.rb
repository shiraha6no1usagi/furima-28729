class ManagementAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    Management.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end
