class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  def quantity_string
    quantity.to_s
  end

  def quantity_string=(value)
    self.quantity = value.to_i
  end
end