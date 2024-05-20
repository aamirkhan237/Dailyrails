class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :street, :city, :state, :zip, presence: true

  def full_address
    "#{name} ,#{street}, #{city}, #{state}, #{zip}, #{country}"
  end
end
