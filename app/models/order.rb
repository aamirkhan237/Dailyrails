class Order < ApplicationRecord
  # before_validation :set_total_price
  validates :total_price, presence: true
  belongs_to :user
  has_many :order_items, dependent: :destroy
  belongs_to :address
  enum state: { pending: 0, paid: 1, shipped: 2, cancelled: 3 }
  # accepts_nested_attributes_for :order_items
  def formatted_total_price
    '%.2f' % total_price
  end
 
  private
  # def set_total_price
  #   self.total_price ||= order_items.sum { |item| item.product.price * item.quantity }
  # end

end
