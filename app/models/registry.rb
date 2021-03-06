class Registry < ApplicationRecord
  belongs_to :user, inverse_of: :registries

  has_many :registry_products
  has_many :products, through: :registry_products

  validates :user, :title, presence: true
end