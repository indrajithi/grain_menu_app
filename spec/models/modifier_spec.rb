require 'rails_helper'

RSpec.describe Modifier, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      modifier = build(:modifier)

      expect(modifier).to be_valid
    end

    it 'is not valid without an item' do
      modifier = build(:modifier, item: nil)

      expect(modifier).not_to be_valid
    end

    it 'is not valid without a modifier_group' do
      modifier = build(:modifier, modifier_group: nil)

      expect(modifier).not_to be_valid
    end

    it 'is not valid without a display_order' do
      modifier = build(:modifier, display_order: nil)

      expect(modifier).not_to be_valid
    end

    it 'is not valid without a default_quantity' do
      modifier = build(:modifier, default_quantity: nil)

      expect(modifier).not_to be_valid
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
