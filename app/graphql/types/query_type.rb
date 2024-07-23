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


  end
end
