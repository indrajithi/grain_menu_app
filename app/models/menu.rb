# frozen_string_literal: true

class Menu < ApplicationRecord
  validates :label, presence: true
  validates :state, presence: true
end
