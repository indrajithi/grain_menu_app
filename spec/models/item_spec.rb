require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'associations' do
    it 'has many section_items' do
      association = described_class.reflect_on_association(:section_items)

      expect(association.macro).to eq(:has_many)
    end

    it 'has many sections through section_items' do
      association = described_class.reflect_on_association(:sections)

      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:section_items)
    end

    it 'has many item_modifier_groups' do
      association = described_class.reflect_on_association(:item_modifier_groups)

      expect(association.macro).to eq(:has_many)
    end

    it 'has many modifier_groups through item_modifier_groups' do
      association = described_class.reflect_on_association(:modifier_groups)

      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:item_modifier_groups)
    end

    it 'has many modifiers' do
      association = described_class.reflect_on_association(:modifiers)

      expect(association.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      item = build(:item)

      expect(item).to be_valid
    end

    it 'is not valid without an identifier' do
      item = build(:item, identifier: nil)

      expect(item).to_not be_valid
      expect(item.errors[:identifier]).to include("can't be blank")
    end

    it 'is not valid without a label' do
      item = build(:item, label: nil)

      expect(item).to_not be_valid
      expect(item.errors[:label]).to include("can't be blank")
    end

    it 'is not valid without a type' do
      item = build(:item, type: nil)

      expect(item).to_not be_valid
      expect(item.errors[:type]).to include("can't be blank")
    end

    it 'is not valid with an invalid type' do
      item = build(:item, type: "InvalidType")

      expect(item).to_not be_valid
      expect(item.errors[:type]).to include("InvalidType is not a valid type")
    end
  end
end
