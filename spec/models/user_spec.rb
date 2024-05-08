require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating user' do
    let(:user) {build :user}
    it 'should be valid user with all attirbutes' do
      expect(user.valid?).to  eq(true)
    end


  end
end
