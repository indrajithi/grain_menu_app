module Types
  class ModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :selection_required_min, Int, null: false
    field :selection_required_max, Int, null: false
    field :modifiers, [Types::ModifierType], null: false

    def modifiers
      object.modifiers
    end
  end
end
