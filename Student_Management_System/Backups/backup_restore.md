# STUDENT MANAGEMENT SYSTEM
## Database Backup and Restore Guide

### 1. Introduction

Database backups protect student records against accidental deletion, hardware failure and data loss.

This project uses PostgreSQL backup tools:
- `pg_dump` for creating database backups.
- `pg_restore` for restoring custom-format backups.
- `createdb` for creating a test database.

### 2. Create a Database Backup

The following Windows PowerShell command creates a custom-format backup:

```powershell
pg_dump -h localhost -p 5432 -U postgres -F c -d student_management -f ".\backups\student_management_backup.dump"
```

The database administrator will be prompted for a password if required.

### 3. Create a Test Database

Create a separate database for testing restoration:

```powershell
createdb -h localhost -p 5432 -U postgres student_management_restore_test
```

### 4. Restore the Backup

Restore the backup into the test database:

```powershell
pg_restore -h localhost -p 5432 -U postgres -d student_management_restore_test ".\backups\student_management_backup.dump"
```

### 5. Verify the Restoration

Connect to the restored database and check its tables:

```sql
\c student_management_restore_test

\dt

SELECT COUNT(*) FROM students;
SELECT COUNT(*) FROM courses;
SELECT COUNT(*) FROM enrollments;
```

### 6. Backup Security

1. Store backups in a secure location.
2. Restrict backup access to authorized administrators.
3. Never commit real database passwords to GitHub.
4. Create backups regularly.
5. Test restoration procedures.
6. Keep more than one backup copy.

### 7. Important Notes

- These commands are prepared examples and have not been executed.
- PostgreSQL and its command-line tools must be installed before they can run.
- Restoration should first be tested in a separate database.
- The backup file should be protected because it contains student information.

### 8. Conclusion

A regular backup and tested restoration process helps protect the Student Management System from data loss and supports reliable database recovery.