# Database Script 0x02 - Seeding Data

## Overview
This directory contains the Data Manipulation Language (DML) scripts used to populate the DataScape database with initial sample data.

## Content
- **Users**: Includes one host, one guest, and one admin.
- **Properties**: Two distinct property listings located in New York and Malibu.
- **Bookings**: Sample reservations for the properties.
- **Payments**: Transaction records linked to the bookings.
- **Reviews**: Guest feedback for property listings.

## Usage
Run the script after the schema has been created:
```bash
psql -d airbnb_db -f seed.sql