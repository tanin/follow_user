require 'rails_helper'

describe User, type: :model do
  before do
    # TODO: move to spec_helper
    Faker::Name.unique.clear
  end

  let(:user) { build(:user) }

  it 'creates record' do
    expect(user.save!).to be true
  end

  describe '#name' do
    context 'validations' do
      context 'when is nil' do
        it 'is invalid' do
          user.name = nil

          expect(user).to_not be_valid
        end
      end

      context 'when is not unique' do
        it 'is invalid' do
          user.save!
          new_user = build(:user)
          new_user.name = user.name

          expect(new_user).to_not be_valid
        end
      end
    end
  end

  describe '#email' do
    context 'validations' do
      context 'when is nil' do
        it 'is invalid' do
          user.email = nil

          expect(user).to_not be_valid
        end
      end

      context 'when is not unique' do
        it 'is invalid' do
          user.save!
          new_user = build(:user)
          new_user.email = user.email

          expect(new_user).to_not be_valid
        end
      end

      context 'when is invalid email' do
        it 'is invalid' do
          user.email = 'foo@bar.'

          expect(user).to_not be_valid
        end
      end
    end
  end
end
