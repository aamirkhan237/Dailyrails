require 'rails_helper'

RSpec.describe User, type: :model do

  context 'when creating user' do
    let(:user) {build :user}
    let(:user1) { build :user, email: user.email, mobile_number: user.mobile_number}
    it 'should be valid user with all attirbutes' do
      expect(user.valid?).to  eq(true)
    end
    it 'should raise exception have unique phone number and email' do
      user.save
      # debugger
      expect(user1.save).to eq(false)
      expect{user1.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'validations' do
    it 'requires first name' do
      user = build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it 'requires last name' do
      user = build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it 'requires mobile number' do
      user = build(:user, mobile_number: nil)
      expect(user).not_to be_valid
    end

    it 'requires location' do
      user = build(:user, location: nil)
      expect(user).not_to be_valid
    end

    it 'requires email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'requires date of birth' do
      user = build(:user, date_of_birth: nil)
      expect(user).not_to be_valid
    end
  end
  
  context '#omniauth_sign_in?' do
  it 'returns true if provider is present' do
    user = build(:user, provider: 'google_oauth2')
    expect(user.omniauth_sign_in?).to eq(true)
  end

  it 'return false if provider is not present' do
    user=build(:user, provider: nil)
    expect(user.omniauth_sign_in?).to eq(false)
  end
end

end