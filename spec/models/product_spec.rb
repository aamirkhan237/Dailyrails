# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should have_many(:images_attachments) }
    it { should have_many(:cart_items) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(active: 'active', inactive: 'inactive').backed_by_column_of_type(:string) }
  end

end
