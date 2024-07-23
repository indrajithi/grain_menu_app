module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: false
    field :items, [Types::ItemType], null: false

    def items
      object.items
    end
  end
end
