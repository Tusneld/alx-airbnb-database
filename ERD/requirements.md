# DataScape: Entity-Relationship Requirements

## 1. Entities and Attributes

### User
- `user_id`: Primary Key (UUID)
- `first_name`: String, Not Null
- `last_name`: String, Not Null
- `email`: String, Unique, Not Null
- `password_hash`: String, Not Null
- `phone_number`: String
- `role`: Enum ('host', 'guest', 'admin'), Not Null
- `created_at`: Timestamp

### Property
- `property_id`: Primary Key (UUID)
- `host_id`: Foreign Key (references User.user_id)
- `name`: String, Not Null
- `description`: Text, Not Null
- `location`: String, Not Null
- `price_per_night`: Decimal, Not Null
- `created_at`: Timestamp

### Booking
- `booking_id`: Primary Key (UUID)
- `property_id`: Foreign Key (references Property.property_id)
- `guest_id`: Foreign Key (references User.user_id)
- `start_date`: Date, Not Null
- `end_date`: Date, Not Null
- `total_price`: Decimal, Not Null
- `status`: Enum ('pending', 'confirmed', 'canceled')
- `created_at`: Timestamp

### Payment
- `payment_id`: Primary Key (UUID)
- `booking_id`: Foreign Key (references Booking.booking_id)
- `amount`: Decimal, Not Null
- `payment_method`: Enum ('credit_card', 'paypal', 'stripe')
- `status`: Enum ('pending', 'completed', 'failed')
- `created_at`: Timestamp

### Review
- `review_id`: Primary Key (UUID)
- `property_id`: Foreign Key (references Property.property_id)
- `user_id`: Foreign Key (references User.user_id)
- `rating`: Integer (1-5)
- `comment`: Text
- `created_at`: Timestamp

## 2. Relationships
- **User -> Property**: One-to-Many (One host can list multiple properties).
- **User -> Booking**: One-to-Many (One guest can make multiple bookings).
- **Property -> Booking**: One-to-Many (One property can have many bookings over time).
- **Booking -> Payment**: One-to-One (One booking has one specific payment record).
- **Property -> Review**: One-to-Many (One property can have multiple guest reviews).