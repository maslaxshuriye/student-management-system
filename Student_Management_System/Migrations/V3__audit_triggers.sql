
-- =====================================================
-- V3: AUDIT LOGS AND TRIGGERS
-- Student Management System
-- =====================================================

-- Generic audit function for tracking INSERT, UPDATE and DELETE
CREATE OR REPLACE FUNCTION log_database_changes()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    old_record JSONB;
    new_record JSONB;
    affected_record_id INTEGER;
BEGIN
    IF TG_OP IN ('UPDATE', 'DELETE') THEN
        old_record := to_jsonb(OLD);
    END IF;

    IF TG_OP IN ('INSERT', 'UPDATE') THEN
        new_record := to_jsonb(NEW);
    END IF;

    affected_record_id := COALESCE(
        (new_record ->> TG_ARGV[0])::INTEGER,
        (old_record ->> TG_ARGV[0])::INTEGER
    );

    INSERT INTO audit_logs (
        table_name,
        operation,
        record_id,
        old_values,
        new_values
    )
    VALUES (
        TG_TABLE_NAME,
        TG_OP,
        affected_record_id,
        old_record,
        new_record
    );

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;

    RETURN NEW;
END;
$$;

-- Audit student changes
CREATE TRIGGER trg_students_audit
AFTER INSERT OR UPDATE OR DELETE ON students
FOR EACH ROW
EXECUTE FUNCTION log_database_changes('student_id');

-- Audit course changes
CREATE TRIGGER trg_courses_audit
AFTER INSERT OR UPDATE OR DELETE ON courses
FOR EACH ROW
EXECUTE FUNCTION log_database_changes('course_id');

-- Audit enrollment changes
CREATE TRIGGER trg_enrollments_audit
AFTER INSERT OR UPDATE OR DELETE ON enrollments
FOR EACH ROW
EXECUTE FUNCTION log_database_changes('enrollment_id');
