class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  has_one_attached :image
  enum status: { active: 'active', inactive: 'inactive' }
  has_many :orderables
  has_many :carts, through: :orderables
  
def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "name", "price", "updated_at"]
    end
end
