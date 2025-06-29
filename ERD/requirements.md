# Airbnb Database Design and Schema

## Overview

This document outlines the data schema for the Airbnb clone backend database. The design supports core functionality such as property listings, user bookings, 
payments, messaging, and reviews.

The Entity-Relationship Diagram (ERD) provides a visual summary of the database structure and is included below.

![Airbnb Database ERD](./airbnb-db.png)

---

## Entities and Attributes

### User
- **user_id**: UUID, Primary Key, Indexed
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM ('guest', 'host', 'admin'), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property
- **property_id**: UUID, Primary Key, Indexed
- **host_id**: UUID, Foreign Key → User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- **booking_id**: UUID, Primary Key, Indexed
- **property_id**: UUID, Foreign Key → Property(property_id)
- **user_id**: UUID, Foreign Key → User(user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM ('pending', 'confirmed', 'canceled'), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment
- **payment_id**: UUID, Primary Key, Indexed
- **booking_id**: UUID, Foreign Key → Booking(booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL

### Review
- **review_id**: UUID, Primary Key, Indexed
- **property_id**: UUID, Foreign Key → Property(property_id)
- **user_id**: UUID, Foreign Key → User(user_id)
- **rating**: INTEGER, CHECK (rating BETWEEN 1 AND 5), NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message
- **message_id**: UUID, Primary Key, Indexed
- **sender_id**: UUID, Foreign Key → User(user_id)
- **recipient_id**: UUID, Foreign Key → User(user_id)
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


## Relationships

- **User ↔ Property**: One-to-Many  
  A user with role 'host' can list multiple properties.

- **User ↔ Booking**: One-to-Many  
  A guest user can make multiple bookings.

- **Property ↔ Booking**: One-to-Many  
  Each property can have multiple bookings.

- **Booking ↔ Payment**: One-to-One  
  Each booking can have one corresponding payment.

- **User ↔ Review ↔ Property**: Many-to-One  
  A guest can leave one review per property they booked.

- **User ↔ Message**: Many-to-Many (self-referential)  
  Users can send and receive messages to/from other users.


## Indexing and Constraints

- **Primary Keys**: All primary key fields are indexed automatically.
- **User**: Unique constraint on `email`.
- **Booking**: `status` must be one of `pending`, `confirmed`, or `canceled`.
- **Review**: `rating` must be between 1 and 5.
- **Foreign Keys**: Enforced across `host_id`, `user_id`, `property_id`, `booking_id`, `sender_id`, and `recipient_id`.

