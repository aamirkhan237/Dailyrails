class Order < ApplicationRecord
  before_save :calculate_total_price
  validates :total_price, presence: true
  belongs_to :user
  has_many :order_items
  belongs_to :address
  enum state: { pending: 0, paid: 1, shipped: 2, cancelled: 3 }

  private
  def calculate_total_price
    self.total_price = order_items.sum { |item| item.product.price * item.quantity }
  end
end
