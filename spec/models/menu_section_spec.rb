require 'rails_helper'

RSpec.describe MenuSection, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      menu_section = build(:menu_section)

      expect(menu_section).to be_valid
    end

    it 'is not valid without a menu' do
      menu_section = build(:menu_section, menu: nil)

      expect(menu_section).not_to be_valid
    end

    it 'is not valid without a section' do
      menu_section = build(:menu_section, section: nil)

      expect(menu_section).not_to be_valid
    end

    it 'is not valid without a display_order' do
      menu_section = build(:menu_section, display_order: nil)

      expect(menu_section).not_to be_valid
    end

    it 'has a default display_order of 0' do
      menu_section = MenuSection.new

      expect(menu_section.display_order).to eq(0)
    end
  end

  describe 'associations' do
    it 'belongs to menu' do
      association = described_class.reflect_on_association(:menu)

      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to section' do
      association = described_class.reflect_on_association(:section)

      expect(association.macro).to eq :belongs_to
    end
  end
end
