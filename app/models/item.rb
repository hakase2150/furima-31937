class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  belongs_to :user

  has_one_attached :image

  with_options presence:true do
    validates :name
    validates :description
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :days_to_ship_id

      with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
        validates :price
      end
    end
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

end