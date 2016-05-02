class Product < ApplicationRecord
  belongs_to :user
  has_many :registry_products
  has_many :registries, through: :registry_products

  validates :user, :price, :title, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0 }
end