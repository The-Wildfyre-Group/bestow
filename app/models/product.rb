class Product < ApplicationRecord
  belongs_to :user, inverse_of: :products
  has_many :registry_products
  has_many :cart_items, inverse_of: :product
  has_many :registries, through: :registry_products

  validates :user, :price, :title, presence: true

  monetize :price_cents, :numericality => { :greater_than_or_equal_to => 0 }
end