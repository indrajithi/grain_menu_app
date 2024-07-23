module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: false
    field :price, Float, null: false
    field :type, String, null: false
    field :modifier_groups, [Types::ModifierGroupType], null: false

    def modifier_groups
      object.modifier_groups
    end
  end
end
