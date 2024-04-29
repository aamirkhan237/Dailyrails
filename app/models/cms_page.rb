class CmsPage < ApplicationRecord
    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :description, presence: true
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "slug", "title", "updated_at"]
      end
      
end
