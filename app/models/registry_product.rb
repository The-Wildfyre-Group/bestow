class RegistryProduct < ApplicationRecord
  belongs_to :product
  belongs_to :registry
end