# Student Management System

## Database Capstone Project

**Project Type:** Relational Database Management System  
**Primary Database:** PostgreSQL  
**Caching Technology:** Redis  
**Project Status:** Design and implementation files prepared; execution and testing pending.

---

## 1. Project Overview

The Student Management System is a relational database project designed to store, organize and manage academic information within an educational institution.

It provides a structured approach to managing students, departments, instructors, courses, enrollments, assessments and academic results.

## 2. Project Objectives

- Store student information securely.
- Manage departments and instructors.
- Organize courses and student registrations.
- Record assessments and student results.
- Improve database performance using indexes.
- Track database changes using audit logs.
- Protect sensitive information using Row-Level Security.
- Support database backup and recovery.

## 3. Database Entities

The system contains eight main entities:

| Entity | Purpose |
|---|---|
| Departments | Stores academic departments |
| Students | Stores student records |
| Instructors | Stores instructor information |
| Courses | Stores courses offered |
| Enrollments | Records student course registrations |
| Assessments | Stores assessment information |
| Results | Stores student assessment results |
| Audit Logs | Tracks database changes |

## 4. Project Structure

```text
Student_Management_System/
│
├── docs/
│   ├── requirements.md
│   └── ER_Diagram.mmd
│
├── migrations/
│   ├── V1__core_tables.sql
│   ├── V2__create_indexes.sql
│   ├── V3__audit_triggers.sql
│   ├── V4__row_level_security.sql
│   └── V5__seed_demo_data.sql
│
├── redis/
│   ├── cache_design.md
│   └── cache.py
│
├── queries/
│   ├── analytical_queries.sql
│   └── optimization_evidence.md
│
├── security/
│   └── security_checklist.md
│
├── backups/
│   └── backup_restore.md
│
├── presentation/
│   └── capstone_walkthrough.md
│
└── README.md
```

## 5. Database Technologies

### PostgreSQL
PostgreSQL is the primary relational database used in the project design.

### Flyway
Flyway is proposed for managing ordered database migrations.

### Redis
Redis is proposed as a caching layer to improve access to frequently requested student information.

### SQL
SQL is used for database creation, data management, analytical queries and performance optimization.

## 6. Database Migrations

The project contains five ordered migration files:

1. **V1:** Creates the core database tables and relationships.
2. **V2:** Creates indexes to support frequently used queries.
3. **V3:** Implements audit logs and database triggers.
4. **V4:** Defines database roles, permissions and Row-Level Security.
5. **V5:** Inserts demonstration records.

## 7. Performance Optimization

The project includes analytical SQL queries for:

- Counting students by department.
- Listing courses and instructors.
- Monitoring course enrollments.
- Calculating student average scores.
- Identifying high assessment scores.

An EXPLAIN ANALYZE evidence template is provided for comparing query performance before and after indexing.

## 8. Security Features

The proposed security controls include:

- Role-based database permissions.
- Row-Level Security policies.
- Primary and foreign key constraints.
- Audit logging through database triggers.
- Parameterized SQL queries.
- Secure handling of database credentials.

## 9. Backup and Recovery

The project documents PostgreSQL backup and restoration using:

- `pg_dump`
- `pg_restore`

The backup and restoration procedures are documented in the `backups` folder.

## 10. Project Testing Status

**Important:** The project files and SQL scripts have been prepared, but the database environment was not installed during this development process.

The following activities remain pending:

- Running `flyway clean migrate` against a test database.
- Testing database relationships and migration execution.
- Testing Redis integration.
- Verifying Row-Level Security with separate accounts.
- Capturing actual EXPLAIN ANALYZE performance results.
- Performing and verifying a database backup restoration.

No successful execution or performance measurements are claimed without testing.

## 11. Expected Outcome

The expected outcome is a structured and secure database system that supports academic record management, data integrity, performance optimization and reliable database administration.

## 12. Conclusion

The Student Management System demonstrates the application of relational database design, SQL migrations, indexing, caching, database security, analytical queries and backup planning.

Further execution and testing are required before production deployment.

---

**Project:** Student Management System  
**Module:** Database Capstone Project