class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
