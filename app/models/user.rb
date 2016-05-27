class User < ApplicationRecord
  include Auth::Base

  has_many :products, dependent: :destroy, inverse_of: :user
  has_many :registries, dependent: :destroy, inverse_of: :user
  has_one :cart

  after_create :create_cart
end
