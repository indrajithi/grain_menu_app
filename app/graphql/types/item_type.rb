# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: true
    field :price, Float, null: true
    field :modifier_groups, [Types::ModifierGroupType], null: true

    def modifier_groups
      object.modifier_groups
    end
  end
end
