
-- =====================================================
-- V5: SEED DEMONSTRATION DATA
-- Student Management System
-- =====================================================

-- 1. Departments
INSERT INTO departments (department_name, location)
VALUES
('Information Technology', 'Block A'),
('Electrical Engineering', 'Block B'),
('Business Studies', 'Block C');

-- 2. Instructors
INSERT INTO instructors
(department_id, first_name, last_name, email)
VALUES
(1, 'James', 'Otieno', 'james.otieno@example.com'),
(2, 'Mary', 'Hassan', 'mary.hassan@example.com'),
(3, 'Peter', 'Kamau', 'peter.kamau@example.com');

-- 3. Students
INSERT INTO students
(department_id, first_name, last_name, email, date_of_birth)
VALUES
(1, 'Ahmed', 'Ali', 'ahmed.ali@example.com', '2005-04-12'),
(1, 'Fatima', 'Omar', 'fatima.omar@example.com', '2004-08-20'),
(2, 'Hassan', 'Mohamed', 'hassan.mohamed@example.com', '2005-01-15'),
(2, 'Amina', 'Abdi', 'amina.abdi@example.com', '2004-11-03'),
(3, 'John', 'Mwangi', 'john.mwangi@example.com', '2005-06-25');

-- 4. Courses
INSERT INTO courses
(department_id, instructor_id, course_name, course_code, credit_hours)
VALUES
(1, 1, 'Database Systems', 'IT101', 3),
(1, 1, 'Programming Fundamentals', 'IT102', 4),
(2, 2, 'Electrical Installation', 'EE101', 4),
(3, 3, 'Business Management', 'BS101', 3);

-- 5. Enrollments
INSERT INTO enrollments (student_id, course_id, status)
VALUES
(1, 1, 'Active'),
(1, 2, 'Active'),
(2, 1, 'Active'),
(2, 2, 'Active'),
(3, 3, 'Active'),
(4, 3, 'Active'),
(5, 4, 'Active');

-- 6. Assessments
INSERT INTO assessments
(course_id, assessment_name, maximum_score, assessment_date)
VALUES
(1, 'Database Assignment', 100, '2026-10-10'),
(1, 'Database Examination', 100, '2026-10-20'),
(2, 'Programming Test', 100, '2026-10-15'),
(3, 'Electrical Practical', 100, '2026-10-18');

-- 7. Results
INSERT INTO results (student_id, assessment_id, score)
VALUES
(1, 1, 85),
(1, 2, 78),
(2, 1, 92),
(2, 2, 88),
(3, 4, 75),
(4, 4, 90);
