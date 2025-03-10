class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  validates :display_order, :default_quantity, presence: true
end
