class CartItem < ApplicationRecord
  belongs_to :product, required: true, inverse_of: :cart_items
  belongs_to :owner, polymorphic: true

  default_scope ->{ includes(:product) }

  monetize :price_cents

  #
  # Returns the subtotal, multiplying the quantity times the price of the item.
  #
  def subtotal
    format("%.2f", quantity * price).to_f
  end

  #
  # Updates the quantity of the item
  #
  def update_quantity(new_quantity)
    self.quantity = new_quantity
    save
  end

  #
  # Updates the price of the item
  #
  def update_price(new_price)
    self.price = new_price
    save
  end
end