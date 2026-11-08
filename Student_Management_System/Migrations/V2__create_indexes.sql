
-- =====================================================
-- V2: DATABASE INDEXING
-- Student Management System
-- =====================================================

-- Students
CREATE INDEX idx_students_department
ON students(department_id);

CREATE INDEX idx_students_last_name
ON students(last_name);

-- Instructors
CREATE INDEX idx_instructors_department
ON instructors(department_id);

-- Courses
CREATE INDEX idx_courses_department
ON courses(department_id);

CREATE INDEX idx_courses_instructor
ON courses(instructor_id);

-- Enrollments
CREATE INDEX idx_enrollments_student
ON enrollments(student_id);

CREATE INDEX idx_enrollments_course
ON enrollments(course_id);

-- Assessments
CREATE INDEX idx_assessments_course
ON assessments(course_id);

-- Results
CREATE INDEX idx_results_student
ON results(student_id);

CREATE INDEX idx_results_assessment
ON results(assessment_id);

-- Audit Logs
CREATE INDEX idx_audit_logs_changed_at
ON audit_logs(changed_at);

CREATE INDEX idx_audit_logs_table_operation
ON audit_logs(table_name, operation);
