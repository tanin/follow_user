require 'rails_helper'

describe Relationship, type: :model do
  let(:relationship) { build(:relationship) }

  it 'creates record' do
    expect(relationship.tap(&:save!)).to be_persisted
  end

  describe '#follower' do
    context 'validations' do
      context 'when is nil' do
        it 'is invalid' do
          relationship.follower = nil

          expect(relationship).to_not be_valid
        end
      end

      context 'when is not unique' do
        it 'is invalid' do
          relationship.save!
          new_relationship = build(:relationship)
          new_relationship.follower = relationship.follower
          new_relationship.followed = relationship.followed

          expect(new_relationship).to_not be_valid
        end
      end
    end
  end

  describe '#followed' do
    context 'validations' do
      context 'when is nil' do
        it 'is invalid' do
          relationship.followed = nil

          expect(relationship).to_not be_valid
        end
      end
    end
  end
end
