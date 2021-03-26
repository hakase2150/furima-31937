class UserBuyer
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city, :block, :token
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end