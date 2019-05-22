require 'rails_helper'

describe User, type: :model do
  let(:user) { build(:user) }

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
end
