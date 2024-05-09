require 'rails_helper'

RSpec.describe CmsPage, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
    it { should validate_presence_of(:description) }
  end

  describe 'callbacks' do
    it 'generates slug before validation if title changed and slug is blank' do
      cms_page = create(:cms_page, title: 'Test Page', slug: nil)
      expect(cms_page.slug).to eq('test-page')
    end
  end

  describe 'to_param' do
    it 'uses title to generate slug' do
      cms_page = create(:cms_page, title: 'Test Page')
      expect(cms_page.to_param).to eq('test-page')
    end
  end
end
