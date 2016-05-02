class User < ApplicationRecord
  include Auth::Base

  has_many :products, dependent: :destroy
  has_many :registries, dependent: :destroy
end
