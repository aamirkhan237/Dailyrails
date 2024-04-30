class CmsPage < ApplicationRecord
    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true
    validates :description, presence: true
    before_validation :generate_slug, if: -> { title_changed? && slug.blank? }
    extend FriendlyId
    friendly_id :title, use: :slugged
  def generate_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "id_value", "slug", "title", "updated_at"]
      end
      
end
