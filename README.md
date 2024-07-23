# Menu Application

This is a Ruby on Rails application that provides a GraphQL API for managing a restaurant menu system.

## Setup

### For Development

`docker-compose up --build`

You can query here: `http://localhost:8080/graphiql`

## Improvements

- Database for Production:
  - Currently using SQLite3 in production, which risks data loss on deployment. Transition to a more robust database like PostgreSQL for production. Consider using a managed service like Google Cloud SQL for scalability and reliability.
- API Authentication:
  - Implement authentication for GraphQL APIs to secure endpoints and protect sensitive data. This could involve integrating OAuth, JWT, or another authentication mechanism.
- CI/CD Pipeline:
  - Set up Continuous Integration and Continuous Deployment (CI/CD) pipelines to automate testing and deployment processes.
- Secrets:
  - Better manage the secrets. Consider using google secrets
