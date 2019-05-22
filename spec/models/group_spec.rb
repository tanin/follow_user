require 'rails_helper'

describe Group, type: :model do
  let(:group) { create(:group) }

  it 'creates record' do
    expect(group).to be_persisted
  end

  describe '#name' do
    context 'validations' do
      context 'when is nil' do
        it 'is invalid' do
          group.name = nil

          expect(group).to_not be_valid
        end
      end

      context 'when is not unique' do
        it 'is invalid' do
          group.save!
          new_group = build(:group)
          new_group.name = group.name

          expect(new_group).to_not be_valid
        end
      end
    end
  end
end
