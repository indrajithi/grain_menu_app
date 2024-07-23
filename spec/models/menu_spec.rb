# frozen_string_literal: true

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

  describe 'database columns' do
    it 'has a label column of type string' do
      column = Menu.columns_hash['label']
      expect(column.type).to eq :string
    end

    it 'has a state column of type string' do
      column = Menu.columns_hash['state']
      expect(column.type).to eq :string
    end

    it 'has a start_date column of type date' do
      column = Menu.columns_hash['start_date']
      expect(column.type).to eq :date
    end

    it 'has an end_date column of type date' do
      column = Menu.columns_hash['end_date']
      expect(column.type).to eq :date
    end
  end
end
