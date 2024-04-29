class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  has_one_attached :image
  enum status: { active: 'active', inactive: 'inactive' }
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "name", "price", "updated_at"]
      end
end
