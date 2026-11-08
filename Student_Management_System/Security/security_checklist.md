# STUDENT MANAGEMENT SYSTEM
## Database Security Checklist

### 1. Authentication
- [x] Use database accounts to identify users.
- [x] Separate administrator and student roles.
- [ ] Configure strong passwords for database accounts.
- [ ] Disable unnecessary accounts.

### 2. Authorization
- [x] Create separate student and administrator roles.
- [x] Apply database permissions using GRANT.
- [x] Restrict student access to their own records using Row-Level Security.
- [ ] Test permissions using separate database accounts.

### 3. Data Protection
- [x] Use primary keys and foreign keys to protect data integrity.
- [x] Use NOT NULL and UNIQUE constraints where appropriate.
- [ ] Use encrypted database connections in production.
- [ ] Protect database credentials using environment variables.
- [ ] Restrict access to sensitive student information.

### 4. Audit and Monitoring
- [x] Create an audit_logs table.
- [x] Use database triggers to record INSERT, UPDATE and DELETE operations.
- [ ] Review audit logs regularly.
- [ ] Restrict audit log access to authorized administrators.

### 5. Database Maintenance
- [ ] Perform regular database backups.
- [ ] Test database restoration.
- [ ] Monitor database performance.
- [ ] Apply security updates.
- [ ] Review user permissions regularly.

### 6. Security Best Practices
1. Never store passwords in plain text.
2. Never expose database credentials in source code.
3. Give users only the permissions they need.
4. Use parameterized SQL queries to prevent SQL injection.
5. Keep backup files in secure locations.
6. Use Row-Level Security for sensitive records.
7. Regularly review database activity.

### 7. Conclusion
The Student Management System uses role-based permissions, Row-Level Security, database constraints and audit triggers to protect academic information. Additional security testing and operational controls are required before production deployment.