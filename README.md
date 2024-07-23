# Menu Application

This is a Ruby on Rails application that provides a GraphQL API for managing a restaurant menu system.

## Setup

### For Development

`docker-compose up --build`

You can query here: `http://localhost:8080/graphiql`

## Example queries

Query to Retrieve All Menus

```graphql
query {
  menus {
    id
    label
    state
    startDate
    endDate
  }
}
```

Query to Retrieve All Sections in a Menu
```graphql
query {
  menu(id: "1") { 
    sections {
      id
      identifier
      label
      description
    }
  }
}
```

Query to Retrieve Non-Configurable Items in a Section

```graphql
query {
  section(id: "1") {
    items {
      id
      identifier
      label
      description
      price
    }
  }
}
```

Query to Retrieve Configurable Items and Their Modifier Groups

```graphql
query {
  section(id: "2") {
    items {
      id
      identifier
      label
      description
      price
      modifierGroups {
        id
        identifier
        label
        selectionRequiredMin
        selectionRequiredMax
        modifiers {
          id
          displayOrder
          defaultQuantity
          priceOverride
        }
      }
    }
  }
}
```

Query to Retrieve All Modifiers for a Specific Item
```graphql
query {
  item(id: "3") {
    id
    identifier
    label
    modifiers {
      id
      displayOrder
      defaultQuantity
      priceOverride
    }
  }
}
```

## Improvements

- Database for Production:
  - Currently using SQLite3 in production, which risks data loss on deployment. Transition to a more robust database like PostgreSQL for production. Consider using a managed service like Google Cloud SQL for scalability and reliability.
- API Authentication:
  - Implement authentication for GraphQL APIs to secure endpoints and protect sensitive data. This could involve integrating OAuth, JWT, or another authentication mechanism.
- CI/CD Pipeline:
  - Set up Continuous Integration and Continuous Deployment (CI/CD) pipelines to automate testing and deployment processes.
- Secrets:
  - Better manage the secrets. Consider using google secrets
