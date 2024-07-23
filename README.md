# Menu Application

This is a Ruby on Rails application that provides a GraphQL API for managing a restaurant menu system.

## Setup

### For Development

`docker-compose up --build`

You can query here: `http://localhost:8080/graphiql`

`[POST] http://localhost:8080/graphql`

### Production

`https://menu-app-phsfrqfxea-as.a.run.app/graphiql`

`[POST] https://menu-app-phsfrqfxea-as.a.run.app/graphql`


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

Curl:

```curl
curl --location 'https://menu-app-phsfrqfxea-as.a.run.app/graphql' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "query": "query { menus { id label state startDate endDate } }"
}'
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

Curl:

```curl
curl --location 'https://menu-app-phsfrqfxea-as.a.run.app/graphql' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "query": "query { menu(id: \"1\") { sections { id identifier label description } } }"
}'
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

Curl:

```curl
curl --location 'https://menu-app-phsfrqfxea-as.a.run.app/graphql' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "query": "query { section(id: \"1\") { items { id identifier label description price } } }"
}'
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

Curl:

```curl
curl --location 'https://menu-app-phsfrqfxea-as.a.run.app/graphql' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "query": "query { section(id: \"2\") { items { id identifier label description price modifierGroups { id identifier label selectionRequiredMin selectionRequiredMax modifiers { id displayOrder defaultQuantity priceOverride } } } } }"
}'
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

Curl:

```curl
curl --location 'https://menu-app-phsfrqfxea-as.a.run.app/graphql' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "query": "query { item(id: \"3\") { id identifier label modifiers { id displayOrder defaultQuantity priceOverride } } }"
}'
```

## Improvements

- Database for Production:
  - Currently using SQLite3 in production, which risks data loss on deployment. Transition to a more robust database like PostgreSQL for production. Consider using a managed service like Google Cloud SQL for scalability and reliability.
- API Authentication:
  - Currently we have a token auth. This could be improved.
- CI/CD Pipeline:
  - Set up Continuous Integration and Continuous Deployment (CI/CD) pipelines to automate testing and deployment processes.
- Secrets:
  - Better manage the secrets. Consider using google secrets
