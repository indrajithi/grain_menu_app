require 'rails_helper'

RSpec.describe SectionItem, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      section_item = build(:section_item)

      expect(section_item).to be_valid
    end

    it 'is not valid without a section' do
      section_item = build(:section_item, section: nil)

      expect(section_item).not_to be_valid
    end

    it 'is not valid without an item' do
      section_item = build(:section_item, item: nil)

      expect(section_item).not_to be_valid
    end

    it 'is not valid without a display_order' do
      section_item = build(:section_item, display_order: nil)

      expect(section_item).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to section' do
      association = described_class.reflect_on_association(:section)

      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to item' do
      association = described_class.reflect_on_association(:item)

      expect(association.macro).to eq :belongs_to
    end
  end
end
