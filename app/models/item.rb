class Item < ApplicationRecord
  self.inheritance_column = :_type_disabled # This disables STI by changing the inheritance column

  has_many :section_items
  has_many :sections, through: :section_items
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups
  has_many :modifiers

  validates :identifier, :label, :type, presence: true

  validates :type, inclusion: { in: %w[Product Component], message: '%<value>s is not a valid type' }
end
