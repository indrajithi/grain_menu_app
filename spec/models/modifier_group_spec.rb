require 'rails_helper'

RSpec.describe ModifierGroup, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      modifier_group = build(:modifier_group)

      expect(modifier_group).to be_valid
    end

    it 'is not valid without an identifier' do
      modifier_group = build(:modifier_group, identifier: nil)

      expect(modifier_group).not_to be_valid
    end

    it 'is not valid without a label' do
      modifier_group = build(:modifier_group, label: nil)

      expect(modifier_group).not_to be_valid
    end

    it 'is not valid without selection_required_min' do
      modifier_group = build(:modifier_group, selection_required_min: nil)

      expect(modifier_group).not_to be_valid
    end

    it 'is not valid without selection_required_max' do
      modifier_group = build(:modifier_group, selection_required_max: nil)

      expect(modifier_group).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many items through item_modifier_groups' do
      association = described_class.reflect_on_association(:items)

      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :item_modifier_groups
    end

    it 'has many modifiers' do
      association = described_class.reflect_on_association(:modifiers)
      expect(association.macro).to eq :has_many
    end
  end
end
