require 'rails_helper'

describe User, type: :model do
  let(:user) { build(:user) }
  let(:new_user) { build(:user) }

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

  describe '#relationships_count' do

    before do
      user.save!
      new_user.save!
    end

    it 'increases and decreases relationships_count' do
      expect { user.active_relationships.create!(followed: new_user) }.to change(new_user, :relationships_count).by(1).and(
        change(user, :relationships_count).by(0)
      )

      expect { user.active_relationships.destroy_all }.to change(new_user, :relationships_count).by(-1).and(
        change(user, :relationships_count).by(0)
      )
    end
  end

  describe '#followed?' do
    before do
      user.save!
      new_user.save!
    end

    context 'when followed' do
      it 'return true' do
        user.active_relationships.create!(followed: new_user)

        expect(new_user.reload.followed?(user)).to eq(true)
      end
    end
  end
end
