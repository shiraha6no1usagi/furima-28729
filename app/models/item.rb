class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :management
  has_one :shipping_address
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipping_origin_id, numericality: { other_than: 0 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
