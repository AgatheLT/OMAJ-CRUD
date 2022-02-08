class Product < ApplicationRecord
  belongs_to :category

  validates :name, :description, :brand, :color, :price, presence: true
end
