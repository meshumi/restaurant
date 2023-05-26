class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items

  validates :restaurant, presence: true

  accepts_nested_attributes_for :order_items
end
