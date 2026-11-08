
-- =====================================================
-- V4: ROW-LEVEL SECURITY
-- Student Management System
-- =====================================================

-- Create application roles if they do not already exist
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'student_user'
    ) THEN
        CREATE ROLE student_user NOLOGIN;
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_roles WHERE rolname = 'student_admin'
    ) THEN
        CREATE ROLE student_admin NOLOGIN;
    END IF;
END;
$$;

-- Allow application roles to connect through the database owner
GRANT USAGE ON SCHEMA public TO student_user, student_admin;

-- Grant table permissions
GRANT SELECT ON students, courses, departments, enrollments,
    assessments, results TO student_user;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public
    TO student_admin;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public
    TO student_admin;

-- Enable Row-Level Security
ALTER TABLE students ENABLE ROW LEVEL SECURITY;
ALTER TABLE results ENABLE ROW LEVEL SECURITY;

-- Students can only view their own student record
CREATE POLICY student_view_own_record
ON students
FOR SELECT
TO student_user
USING (
    student_id = NULLIF(
        current_setting('app.student_id', true), ''
    )::INTEGER
);

-- Students can only view their own results
CREATE POLICY student_view_own_results
ON results
FOR SELECT
TO student_user
USING (
    student_id = NULLIF(
        current_setting('app.student_id', true), ''
    )::INTEGER
);

-- Administrators can access all student records
CREATE POLICY admin_manage_students
ON students
FOR ALL
TO student_admin
USING (TRUE)
WITH CHECK (TRUE);

-- Administrators can access all results
CREATE POLICY admin_manage_results
ON results
FOR ALL
TO student_admin
USING (TRUE)
WITH CHECK (TRUE);

-- Grant audit log access only to administrators
GRANT SELECT ON audit_logs TO student_admin;
