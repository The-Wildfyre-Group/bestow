class CartItemSerializer < ActiveModel::Serializer
  belongs_to :product

  attributes :quantity, :price, :id

  def price
    object.price.to_s
  end
end