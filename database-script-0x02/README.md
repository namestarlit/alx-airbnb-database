# Airbnb Database Sample Seed

This directory provides a SQL seed script to populate the Airbnb database with initial sample data for testing and development.


## Contents

- `seed.sql`: SQL script to insert sample users, properties, bookings, payments, reviews, and messages.
- `README.md`: This file.


## Setup Instructions

### Prerequisites

- You must have already created the database and tables using `schema.sql`.
- Ensure PostgreSQL is running and accessible.

### Load the Sample Data

1. **Connect to the database**  
   Replace `airbnb` with your database name if different.
   ```bash
   psql -d airbnb -f seed.sql
   ````

2. **Verify Inserted Data**
   You can check data in the database with:

   ```sql
   SELECT * FROM users;
   SELECT * FROM properties;
   ```


## Sample Data Overview

* **3 Users**: Host, guest, and admin roles.
* **2 Properties**: Owned by the host.
* **2 Bookings**: Made by the guest.
* **1 Payment**: For a confirmed booking.
* **1 Review**: Feedback left by guest.
* **2 Messages**: Conversations between host and guest.

