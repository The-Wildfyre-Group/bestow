class Cart < ApplicationRecord
  has_many :cart_items, as: :owner
  belongs_to :user

  #
  # Adds a product to the cart
  #
  def add(object, price, quantity = 1, cumulative = true)
    cart_item = item_for(object)
    if cart_item
      cumulative = cumulative ? cart_item.quantity : 0
      cart_item.quantity = (cumulative + quantity)
      cart_item.save
      cart_item
    else
      cart_item = cart_items.create(product_id: object.id, price: price, quantity: quantity)
    end
    cart_item.valid?
  end

  #
  # Deletes all cart_items in the shopping_cart
  #
  def clear
    cart_items.clear
  end

  #
  # Returns true when the cart is empty
  #
  def empty?
    cart_items.empty?
  end

  #
  # Remove an item from the cart
  #
  def remove(object, quantity = 1)
    cart_item = item_for(object)

    return unless cart_item

    if cart_item.quantity <= quantity
      cart_item.delete
    else
      cart_item.quantity = (cart_item.quantity - quantity)
      cart_item.save
    end
  end

  #
  # Returns the subtotal by summing the price times quantity for all the
  # items in the cart
  #
  def subtotal
    cart_items.inject(Money.new(0)) { |a, e| a + (e.price * e.quantity) }
  end

  def shipping_cost
    Money.new(0)
  end

  def taxes
    subtotal * tax_pct * 0.01
  end

  def tax_pct
    0
  end

  #
  # Returns the total by summing the subtotal, taxes and shipping_cost
  #
  def total
    subtotal + taxes + shipping_cost
  end

  #
  # Return the number of unique items in the cart
  #
  def total_unique_items
    cart_items.map(&:quantity).sum
  end

  def item_for(product)
    cart_items.where(product_id: product.id).first
  end

  #
  # Returns the subtotal of a specified item by multiplying the quantity times
  # the price of the item.
  #
  def subtotal_for(product)
    item = item_for(product)
    item ? item.subtotal : 0
  end

  #
  # Returns the quantity of the specified product
  #
  def quantity_for(product)
    item = item_for(product)
    item ? item.quantity : 0
  end

  #
  # Updates the quantity of the specified product
  #
  def update_quantity_for(product, new_quantity)
    item = item_for(product)
    item.update_quantity(new_quantity) if item
  end

  #
  # Returns the price of the specified product
  #
  def price_for(product)
    item = item_for(product)
    item ? item.price : 0
  end

  #
  # Updates the price of the specified product
  #
  def update_price_for(product, new_price)
    item = item_for(product)
    item.update_price(new_price) if item
  end
end