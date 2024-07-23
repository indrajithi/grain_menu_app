require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      menu = build(:menu)
      expect(menu).to be_valid
    end

    it 'is not valid without a label' do
      menu = build(:menu, label: nil)
      expect(menu).not_to be_valid
    end

    it 'is not valid without a state' do
      menu = build(:menu, state: nil)
      expect(menu).not_to be_valid
    end
  end
end
