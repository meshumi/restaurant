class Restaurant < ApplicationRecord
  has_many :menu_items
  has_many :orders

  validates :name, presence: true
  validates :address, presence: true
end
