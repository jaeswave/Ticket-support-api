Ticket Support Backend | Ruby on Rails + GraphQL

This is the backend API for a customer support ticketing system. It allows customers to create support requests, add comments, and track ticket statuses. Support agents can respond, export reports, and receive email reminders.

---

## Live App URL

**GraphQL Endpoint**  
🔗 https://ticket-support-api.onrender.com/graphql

---

## Tech Stack

- **Framework**: Ruby on Rails 8
- **Language**: Ruby 3.2
- **API**: GraphQL
- **Database**: PostgreSQL
- **Authentication**: JWT
- **Background Jobs**: Whenever
- **Uploads**: Active Storage - images/PDFs
- **Env Management**: dotenv-rails

---

## Local Setup Instructions

### 1. Clone Repo

```bash
git clone https://github.com/your-username/ticket-support-backend.git
cd ticket-support-backend

Install Dependencies
bundle install


 Configure Database
 rails db:setup



Environment Variables
DB_USERNAME=
DB_PASSWORD=
JWT_SECRET_KEY=
ELASTIC_EMAIL_SMTP_USER=
ELASTIC_EMAIL_SMTP_PASS=


Start the App
rails server



 Authentication
 Authorization: Bearer your_jwt_token


sign up and login Endpoint
POST /users
Payload:
   user:
    "email": "user@example.com",
    "password": "your_password"
    role:customer


   agent Payload:
   user:
    "email": "user@example.com",
    "password": "your_password"
    role: agent
    invite_code: 123456



POST /login

Payload:
   user:
    "email": "user@example.com",
    "password": "your_password"


 DELETE /logout


GET /tickets#export_csv
GET /tickets/export_csv
Headers:
  Authorization: Bearer <YOUR_JWT_TOKEN>
  Accept: text/csv





  GraphQL Usage

  Ticket Creation (Customer)
  mutation {
  createTicket(input: {
    title: "Login not working",
    description: "Can't access dashboard",
    file: null
  }) {
    ticket {
      id
      title
      status
    }
  }
}




Add Comment (Customer/Agent)
mutation {
  addComment(input: {
    ticketId: 1,
    body: "Please reset your password and try again."
  }) {
    comment {
      id
      body
      createdAt
    }
  }
}
 Known Issues
Render cold starts can delay response on first load.

File uploads require S3 or third-party config in production.





 If More Time Was Available
Add admin dashboard for agents.

Set up cloud storage (e.g. S3) for real file handling.

Add Pundit for fine-grained authorization rules.

Improve GraphQL query performance and add pagination.



 Included Files
/app/graphql/: GraphQL types, mutations, and queries.

/app/models/: User, Ticket, Comment models.

/db/migrate/: All schema and migration files.






```
