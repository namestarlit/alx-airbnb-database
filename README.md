# Airbnb Database Design

This directory contains the SQL schema definition for the Airbnb backend database, intended for use with a PostgreSQL database management system (DMS). The schema includes tables for users, properties, bookings, payments, reviews, and messages.


## Contents

- `schema.sql`: PostgreSQL-compatible DDL statements to create all tables, constraints, and indexes.
- `README.md`: Setup instructions and notes.
- See `../ERD/requirements.md` for entity definitions, relationships, and the ERD image.


## Setup Instructions

### Requirements

- PostgreSQL (version 12 or higher recommended)
- A PostgreSQL user with permission to create databases and tables

### Steps to Initialize the Database

1. **Start PostgreSQL**  
   Ensure PostgreSQL is installed and running.

2. **Create a New Database**  
    ```bash
   createdb airbnb_db
    ````

3. **Run the Schema Script**

   ```bash
   psql -d airbnb_db -f schema.sql
   ```

   Or if using authentication:

   ```bash
   psql -U your_username -W -d airbnb_db -f schema.sql
   ```

4. **Verify Installation**
   Connect and list tables:

   ```bash
   psql -d airbnb_db
   \dt
   ```


## Notes

* Schema follows [sqlstyle.guide](https://www.sqlstyle.guide/) conventions.
* UUIDs are used as primary keys across all tables.
* ENUM-like values are enforced using `CHECK` constraints on `TEXT` columns.
* Timestamps use `CURRENT_TIMESTAMP` for auditability.
* Indexed columns include: `email`, `property_id`, `booking_id` for optimal lookup performance.
* Referential integrity is enforced through foreign keys.


## See Also

For a complete description of the data model, including entity attributes and relationships, refer to:

➡️ [`ERD/requirements.md`](../ERD/requirements.md)
➡️ [`ERD/airbnb-db.png`](../ERD/airbnb-db.png)


