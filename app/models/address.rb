class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :street, :city, :state,  presence: true
  validates :zip, format: { with: /\A\d+\z/, message: "only allows numbers" } , presence: true

  
  def full_address
    "#{name} ,#{street}, #{city},#{zip}, #{state_full},  #{country_full}"
  end
end
