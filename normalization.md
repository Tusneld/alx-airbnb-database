# Database Normalization Report: DataScape (Airbnb)

This document outlines the normalization process applied to the Airbnb database design to ensure data integrity, minimize redundancy, and achieve Third Normal Form (3NF).

---

## 1. First Normal Form (1NF)
**Goal:** Ensure atomicity and uniqueness.

- **Atomic Values:** Each column contains only a single value. For example, the `amenities` in a property are not stored as a comma-separated string but will eventually be handled via a separate table or specific columns.
- **Unique Identifier:** Each table has a defined Primary Key (e.g., `user_id`, `property_id`).
- **No Repeating Groups:** We have eliminated sets of repeating attributes.

## 2. Second Normal Form (2NF)
**Goal:** Remove partial dependencies.

- **Requirement:** The table must be in 1NF and all non-key attributes must be fully functionally dependent on the primary key.
- **Implementation:** - In our design, all attributes in the `Property` table (like `name` and `price`) depend entirely on the `property_id`. 
    - We separated `User` data from `Property` data. A property only stores a `host_id` (Foreign Key) rather than repeating the host's name and email every time they list a house.

## 3. Third Normal Form (3NF)
**Goal:** Remove transitive dependencies.

- **Requirement:** The table must be in 2NF and have no transitive functional dependencies (non-key attributes should not depend on other non-key attributes).
- **Implementation:**
    - **Payment Logic:** We store `amount` in the `Payment` table. While it relates to a `Booking`, the payment status and method are specific to the transaction, not the property itself.
    - **Location:** Instead of having a "City Manager" name inside the `Property` table, we only store the location. If we needed detailed City data (like Zip Codes or Tax Rates), we would move those to a separate `Locations` table to avoid repeating city-wide data for every house in that city.

---

## Summary of Normalized Entities

| Entity | Primary Key | Foreign Keys | Normal Form |
| :--- | :--- | :--- | :--- |
| **User** | `user_id` | None | 3NF |
| **Property** | `property_id` | `host_id` | 3NF |
| **Booking** | `booking_id` | `property_id`, `guest_id` | 3NF |
| **Payment** | `payment_id` | `booking_id` | 3NF |
| **Review** | `review_id` | `property_id`, `user_id` | 3NF |