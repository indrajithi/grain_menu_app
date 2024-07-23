module Types
  class QueryType < Types::BaseObject
    # Add the query to fetch all menus
    field :menus, [Types::MenuType], null: false do
      description 'Retrieve all menus'
    end

    def menus
      Menu.all
    end

    # Add the query to fetch a single menu by ID
    field :menu, Types::MenuType, null: false do
      description 'Retrieve a single menu'
      argument :id, ID, required: true
    end

    def menu(id:)
      Menu.find(id)
    end

    # Add Section Queries
    field :sections, [Types::SectionType], null: false do
      description 'Retrieve all sections'
    end

    def sections
      Section.all
    end

    field :section, Types::SectionType, null: false do
      description 'Retrieve a single section'
      argument :id, ID, required: true
    end

    def section(id:)
      Section.find(id)
    end

    # Add Item Queries
    field :items, [Types::ItemType], null: false do
      description 'Retrieve all items'
    end

    def items
      Item.all
    end

    field :item, Types::ItemType, null: false do
      description 'Retrieve a single item'
      argument :id, ID, required: true
    end

    def item(id:)
      Item.find(id)
    end

    # Add ModifierGroup Queries
    field :modifier_groups, [Types::ModifierGroupType], null: false do
      description 'Retrieve all modifier groups'
    end

    def modifier_groups
      ModifierGroup.all
    end

    field :modifier_group, Types::ModifierGroupType, null: false do
      description 'Retrieve a single modifier group'
      argument :id, ID, required: true
    end

    def modifier_group(id:)
      ModifierGroup.find(id)
    end

    # Add Modifier Queries
    field :modifiers, [Types::ModifierType], null: false do
      description 'Retrieve all modifiers'
    end

    def modifiers
      Modifier.all
    end

    field :modifier, Types::ModifierType, null: false do
      description 'Retrieve a single modifier'
      argument :id, ID, required: true
    end

    def modifier(id:)
      Modifier.find(id)
    end
  end
end
