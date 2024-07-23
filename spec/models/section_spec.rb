require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      section = build(:section)

      expect(section).to be_valid
    end

    it 'is not valid without an identifier' do
      section = build(:section, identifier: nil)

      expect(section).not_to be_valid
    end

    it 'is not valid without a label' do
      section = build(:section, label: nil)

      expect(section).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many menus through menu_sections' do
      association = described_class.reflect_on_association(:menus)

      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :menu_sections
    end

    it 'has many items through section_items' do
      association = described_class.reflect_on_association(:items)

      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :section_items
    end
  end
end
