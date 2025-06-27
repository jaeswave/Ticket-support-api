# 🎟️ Support Ticket System – Backend (Ruby on Rails + GraphQL)

This is the backend service for the Support Ticket System, designed to handle customer support requests and interactions between customers and support agents. Built with Ruby on Rails, PostgreSQL, GraphQL, and Devise.

---

## 📌 Table of Contents

- [Setup Instructions](#setup-instructions)
- [API Endpoint](#api-endpoint)
- [Database Schema](#database-schema)
- [GraphQL Schema](#graphql-schema)
- [Authentication](#authentication)
- [Core Features](#core-features)
- [Testing](#testing)
- [Deployment](#deployment)

---

## 🛠️ Setup Instructions

### Prerequisites
- Ruby 3.2
- Rails 7.x
- PostgreSQL
- Node.js (for ActiveStorage and JS support)

### Installation

```bash
git clone https://github.com/jaeswave/Ticket-support-api.git
cd support-ticket-api
bundle install
rails db:create db:migrate
rails s

 API Endpoint
GraphQL Endpoint:
post - http://localhost:3000/graphql
post - http://localhost:3000/users
get - http://localhost:3000/me
get - http://localhost:3000/ticket/export_csv



🧩 Database Schema
Key tables:

users: roles (customer, agent)

tickets: linked to users

comments: replies by customers and agents

active_storage_*: for file uploads

See /db/schema.rb for full structure.



🧬 GraphQL Schema
The GraphQL schema supports:

Ticket creation & updates

Commenting logic with role-based permissions

File uploads via base64 or signed URL

Queries to fetch tickets, comments, and users

Schema is auto-dumped to schema.graphql

create comment 
  query: `
    mutation CreateComment($ticketId: ID!, $content: String!) {
      createComment(ticketId: $ticketId, content: $content) {
        comment {
          id
          content
          createdAt
          user {
            id
          }
        }
        errors
      }
    }
  `



  create ticket 


     mutation CreateTicket($title: String!) {
      createTicket(title: $title) {
        ticket {
          id
          title
          status
        }
      
    
  `

  assign ticket 

   query: `
          mutation AssignTicket($ticketId: ID!) {
            assignTicket(ticketId: $ticketId) {
              ticket {
                id
                agent {
                  id
                }
              }
              errors
            }
          }
        `,


        get all ticket based on roles 
         query: `
          query Tickets {
            tickets {
              id
              title
              status
              comments {
                id
                content
              }
            }
          }




🔐 Authentication
Using devise for email/password authentication.

Each user has a role (customer or agent) which controls access to m✨ Core Features
For Customers
Sign up / login

Create tickets

View own tickets

Add comment only after agent replies

Upload images or PDFs with ticket

For Agents
View all tickets

Respond to tickets

Export closed tickets from the past month as CSV

Receive daily email reminders of open tickets



✅ Testing
Using RSpec and FactoryBot.

Run tests:
bundle exec rspec

Test coverage includes:

User authentication

Ticket creation and status

Comment permission logic

GraphQL API endpoints








