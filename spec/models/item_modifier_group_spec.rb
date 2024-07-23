require 'rails_helper'

RSpec.describe ItemModifierGroup, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      item_modifier_group = build(:item_modifier_group)

      expect(item_modifier_group).to be_valid
    end

    it 'is not valid without an item' do
      item_modifier_group = build(:item_modifier_group, item: nil)

      expect(item_modifier_group).not_to be_valid
    end

    it 'is not valid without a modifier_group' do
      item_modifier_group = build(:item_modifier_group, modifier_group: nil)
      expect(item_modifier_group).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to item' do
      association = described_class.reflect_on_association(:item)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to modifier_group' do
      association = described_class.reflect_on_association(:modifier_group)
      expect(association.macro).to eq :belongs_to
    end
  end
end
