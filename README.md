# PTCGLogger

A place for you to archive your Pokemon TCG collections. 



## Prerequisites 

Make sure you have the following installed before starting: 

Node.js (v18 or higher) 

PostgreSQL (v14 or higher)



## Setup Instructions

1. Clone the project

2. Install dependencies

   ```
   npm install
   ```

3. Set up the database. Start PostgreSQL, create a local database ptcglogger, and import all the data from database.sql by ```psql -U postgres -d ptcglogger -f database.sql```

4. Configure ```server.js``` to ensure the settings match your local settings. 

   ```js
   const pool = new Pool({
     user: 'postgres',
     host: 'localhost',
     database: 'ptcglogger',
     password: 'your_password_here',
     port: 5432,
   });
   ```

5. Start the server with ```node server.js```, ensure connection as you should see:

   ```
   Server running on http://localhost:3000
   ```

6. Finally, go to ```http://localhost:3000`` on your browser, or simply open index.html. 