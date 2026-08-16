# MySQL Database: Train Ticket Sales System

A relational database design and query project that models the ticketing, seating, and revenue operations of a train sales system: from tourist/booking centers and trains down to individual wagons, coupes, seats, and passengers.

> **Note:** This was built as the **final project for a university database design course**. It focuses on relational modeling, normalization, and SQL query writing rather than a full front-end application; there is no GUI or backend server in this repo. It was completed as **group work with a teammate**, per the course's requirement that final projects be done individually or in groups of up to three students. It's shared here for learning and portfolio purposes.

---

## Project Overview

The system models how a train company sells tickets through affiliated tourist centers, assigns passengers to seats inside coupes, which sit inside wagons, which make up a train. It also tracks vehicles owned by passengers (e.g., for freight/car-carrying wagons) and calculates commissions, revenue, and capacity requirements.

The project walks through the full academic database design pipeline:

1. **Conceptual design**: Entity-Relationship Diagram (ERD)
2. **Logical design**: Relational Model (mapping the ERD to relations/tables)
3. **Formal query design**: Relational Algebra expressions for each required report
4. **Physical implementation**: SQL DDL (table creation) and DML (data population)
5. **Reporting**: A set of SQL queries answering specific business questions, with documented outcomes

---

## Tech Stack and Tools

| Category | Tool / Technology |
|---|---|
| Database engine | MySQL (T-SQL style `GO` batch separators are present, suggesting the queries were originally drafted/tested against SQL Server syntax before targeting MySQL) |
| Query language | SQL (DDL, DML, DQL): joins, CTEs (`WITH`), aggregate functions, `CASE` expressions, set operations (`UNION ALL`) |
| Data modeling | Entity-Relationship (ER) Modeling, Relational Model mapping |
| Formal query theory | Relational Algebra (selection, projection, join, grouping/aggregation, rename, set difference) |
| Documentation | Microsoft Word (`.docx`) for algebra expressions and query outcomes, PDF for the relational model |
| Diagramming | Hand-drawn ERD, exported as image (`.jpg` / `.png`) |

No application framework, ORM, or programming language is used; this is a pure database design and SQL project.

---

## Skills Demonstrated

- **Entity-Relationship (ER) modeling**: identifying entities, attributes, primary keys, foreign keys, and relationship cardinalities (1:N, N:M)
- **Relational schema design**: translating an ERD into normalized tables with appropriate keys and constraints
- **SQL DDL**: writing `CREATE TABLE` statements with primary keys, foreign keys, and appropriate data types
- **SQL DML**: populating a multi-table schema with consistent, referentially-valid sample data
- **Complex SQL querying**, including:
  - Multi-table `JOIN`s (three to four tables deep)
  - Common Table Expressions (CTEs) for multi-step aggregation logic (`WITH ... AS`)
  - Conditional aggregation using `CASE WHEN`
  - `GROUP BY` style aggregate reporting (`SUM`, `COUNT`, `CEILING`)
  - `UNION ALL` to combine differently-grouped result sets into one report
  - `LEFT JOIN` to correctly count "empty"/unfilled entities
- **Relational Algebra**: expressing each SQL report as a formal relational algebra expression (projection, selection, join, aggregation, rename), demonstrating the theoretical foundation behind the SQL
- **Business and analytical reporting**: translating plain-English business questions (revenue, commissions, occupancy, capacity planning) into working queries
- **Technical documentation**: capturing schema, queries, and query outcomes (results) in a reviewable Word document

---

## Repository Structure

```
MySql-Database-Train-Ticket-Sales-System/
│
├── ERD_Diagram/
│   ├── ERD_Diagram.jpg
│   └── Diagram.png
│
├── Relational_Model/
│   └── Relational_Model.pdf
│
├── Relational_Algebra_Expression/
│   └── Relational_Algebra_Expression.docx
│
└── Database_SQL_Queries/
    ├── TableCreation.sql
    ├── TablePopulation.sql
    ├── Report1.sql
    ├── Report2.sql
    ├── Report3.sql
    ├── Report4sql.sql
    ├── Report5asql.sql
    ├── Report5b.sql
    ├── Report5c.sql
    ├── Report5d.sql
    ├── Report6.sql
    └── SQL+Outcomes.docx
```

---

## File-by-File Purpose

### `ERD_Diagram/`
| File | Purpose |
|---|---|
| `ERD_Diagram.jpg` | Hand-drawn Entity-Relationship Diagram showing all entities (`TouristCenter`, `Train`, `Wagon`, `Coupe`, `Passenger`, `Ticket`, `Vehicle`) and their relationships (serves, associate, consists of, accommodate, owns, purchase, issue) with cardinalities. |
| `Diagram.png` | Alternate/exported version of the same ER diagram. |

### `Relational_Model/`
| File | Purpose |
|---|---|
| `Relational_Model.pdf` | The logical relational model derived from the ERD: showing each relation (table) with its attributes, primary keys, and foreign keys before implementation in SQL. |

### `Relational_Algebra_Expression/`
| File | Purpose |
|---|---|
| `Relational_Algebra_Expression.docx` | Formal relational algebra expressions for every report in the project (passenger/wagon/coupe listing, vehicle-to-passenger mapping, filled wagon/coupe counts, empty seats, ticket sales, commissions, gender-based cost breakdown, wagon counts by train, and tractor capacity). Written using standard relational algebra notation: projection, selection, join, aggregation/grouping, and rename. |

### `Database_SQL_Queries/`
| File | Purpose |
|---|---|
| `TableCreation.sql` | DDL script that creates the full schema: `TouristCenter`, `Train`, `Wagon`, `Coupe`, `Passenger`, `Ticket`, and `Vehicle`, with primary and foreign key constraints linking them together. |
| `TablePopulation.sql` | DML script that inserts sample data: 3 tourist centers, 3 trains, 12 wagons, 13 coupes, 14 passengers, 14 tickets, and 14 vehicles; used to test and demonstrate the report queries. |
| `Report1.sql` | Lists each passenger's name, wagon type, coupe type, and gender (three-table join: `Passenger` to `Coupe` to `Wagon`). |
| `Report2.sql` | Lists each registered vehicle with its owner, license plate, and the passenger/wagon/coupe they're associated with (four-table join: `Vehicle` to `Passenger` to `Coupe` to `Wagon`). |
| `Report3.sql` | Uses CTEs to determine how many coupes are fully occupied (Normal = 6 seats, Royal = 4 seats) and how many wagons are fully occupied (both of their coupes filled), broken down by type. |
| `Report4sql.sql` | Finds empty seats: seat number, coupe, wagon, and assigned gender, for seats where no passenger name is recorded. |
| `Report5asql.sql` | Calculates total ticket sales revenue (`SUM(Price)` across all tickets). |
| `Report5b.sql` | Calculates commission owed to each tourist center, based on ticket price multiplied by that center's commission rate. |
| `Report5c.sql` | Breaks down passenger count and total ticket cost by gender. |
| `Report5d.sql` | Reports departure date and wagon count per train, grouped by train name and date. |
| `Report6.sql` | Uses a CTE to calculate the number of tractor units required to pull each train's wagons, based on separate capacity limits for passenger wagons (max 13 per tractor) and freight wagons (max 6 per tractor), taking the greater of the two per train. |
| `SQL+Outcomes.docx` | Consolidated write-up combining all of the SQL above with screenshots/tables of each query's actual output, serving as the project's results/deliverable document. |

---

## Database Schema Summary

**Entities:**
- `TouristCenter`: sales/booking centers that sell tickets and earn commission
- `Train`: a scheduled train, linked to the center that manages it
- `Wagon`: a physical car on a train (`Men`, `Women`, `Family`, or `Freight` type)
- `Coupe`: a compartment inside a wagon (`Normal` or `Royal` type, with a seat count)
- `Passenger`: a person assigned to a seat within a coupe
- `Ticket`: a purchase record linking a passenger, coupe/seat, price, and issuing center
- `Vehicle`: a vehicle owned by a passenger (e.g., for transport via freight wagons)

**Key relationships:** a `TouristCenter` serves/associates with multiple `Train`s, which consist of multiple `Wagon`s, which consist of multiple `Coupe`s, which accommodate multiple `Passenger`s; a `Passenger` purchases a `Ticket` and may own a `Vehicle`.

---

## How to Run

1. Create a MySQL database, e.g.:
   ```sql
   CREATE DATABASE TrainTicketSalesDB;
   ```
2. Run `Database_SQL_Queries/TableCreation.sql` to build the schema.
3. Run `Database_SQL_Queries/TablePopulation.sql` to load sample data.
4. Run any of the `ReportX.sql` files to reproduce the analytical reports.

Note: the scripts include `GO` batch-separator statements (common in SQL Server / T-SQL tooling like Azure Data Studio or SSMS). Standard MySQL clients (e.g., MySQL Workbench, the `mysql` CLI) do not recognize `GO`; remove those lines, or run each statement block individually, when executing against a real MySQL server.

---

## Academic Context

This repository was submitted as the final project for a university database design course. The assignment brief asked students to design a database management system for a train ticket sales system, covering the ERD diagram, the relational model, the relational algebra expressions, and the corresponding SQL commands for each required report.

The project was completed as **group work with a teammate**, following the course's policy that a final project team could include up to three students, with each member submitting the work separately.

### Assignment requirements

The brief specified the following design constraints:

- Each tractor (locomotive) can move at most 13 passenger wagons or 6 freight wagons (used for car transport).
- The ticket sales system must support multiple tourist centers, each identified by a unique code, with a commission amount and contract number set by the system administrator.
- Each train must define, before ticket sales begin:
  - Wagon types: men's passenger wagon, women's passenger wagon, family passenger wagon, and a special freight wagon for transporting cars.
  - Route settings: a departure date set according to wagon capacity, and a manager-defined number of coupes per wagon, with seat counts fixed at 6 for Normal coupes and 4 for Royal coupes.
  - Seat pricing: Normal coupe seats priced at a rate M (coupe total = 6xM) and Royal coupe seats priced at a rate N (coupe total = 4xN).
  - Age-based ticket pricing: passengers aged 12 and over pay full price; passengers under 12 pay half price, calculated automatically from age.
- The system must be able to produce the six report categories implemented in `Database_SQL_Queries/` (passenger/wagon/coupe listing, vehicle-to-passenger mapping, filled wagon/coupe counts, empty seats, financial reports, and tractor capacity).

### Implementation notes relative to the brief

The delivered schema and sample data cover the core structure (tourist centers, trains, wagons, coupes, passengers, tickets, vehicles) and all six report categories. Two spec details are simplified in the delivered SQL and worth knowing if you extend this project:

- **Ticket pricing** is stored directly as a flat `Price` value on each `Ticket` row rather than being derived from a per-seat rate (M or N) times seat count.
- **Age-based half-price ticketing** for passengers under 12 is not encoded as a computed rule in the SQL; `Passenger.Age` is stored, but no query in this repo automatically applies the discount.

Sample data is fictional and used solely for demonstration and testing purposes.
