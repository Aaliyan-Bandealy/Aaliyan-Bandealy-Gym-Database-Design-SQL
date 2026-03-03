# Gym Management System – SQL Database Design

##  Project Overview

This project presents the design and implementation of a relational database system for a Gym Management System.

The system models core gym operations including:

- Member registration
- Trainers
- Membership plans
- Class scheduling
- Payments
- Equipment tracking

The database is fully normalized and implemented using SQL with appropriate primary keys, foreign keys, constraints, and relational integrity rules.

---

##  Database Design

The system was designed using Entity-Relationship (ER) modeling and translated into a relational schema.

### Key Design Features

- Proper Primary Key (PK) and Foreign Key (FK) constraints
- Referential Integrity enforcement
- Normalized tables (up to 3NF)
- Logical separation of entities (Members, Trainers, Classes, Payments, etc.)
---

##  Technologies Used

- SQL
- Relational Database Design
- ER Modeling (Draw.io)

---

## 🚀 How to Run the Project

1. Open your SQL environment (MySQL / PostgreSQL / SQL Server).
2. Run the scripts in this order:

### Step 1 – Create Tables
Run:
```
sql/01_table_creation.sql
```

### Step 2 – Insert Data
Run:
```
sql/02_insert_statements.sql
```

### Step 3 – Execute Analysis Queries
Run:
```
sql/03_analysis_queries.sql
```

---

## 🔍 Example Analytical Queries

The project includes queries such as:

- Retrieve active members
- Calculate total payments per member
- Identify most popular gym classes
- Analyze trainer assignments
- Membership revenue analysis

---

## 🎯 Skills Demonstrated

- Relational Database Design
- ER Modeling
- Primary & Foreign Key Constraints
- Data Integrity Rules
- SQL DDL & DML
- Complex JOIN Queries
- Aggregate Functions & Grouping
- Analytical Query Design
