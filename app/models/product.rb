class Product < ApplicationRecord
  include ActionView::Helpers::NumberHelper
  validates :name, :description, :price, presence: true
  has_many_attached :images 

  enum status: { active: 'active', inactive: 'inactive' }
  has_many :cart_items
  has_many :order_items

  def formatted_price
    "%.3f" % price
  end

def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "name", "price", "updated_at"]
    end
end

