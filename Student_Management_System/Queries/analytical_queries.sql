
-- =====================================================
-- STUDENT MANAGEMENT SYSTEM
-- ANALYTICAL SQL QUERIES
-- =====================================================

-- QUERY 1: Display all registered students
SELECT
    student_id,
    first_name,
    last_name,
    email,
    admission_date
FROM students
ORDER BY last_name;

-- QUERY 2: Count students in each department
SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC;

-- QUERY 3: Display courses and their instructors
SELECT
    c.course_code,
    c.course_name,
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name
FROM courses c
LEFT JOIN instructors i
    ON c.instructor_id = i.instructor_id
ORDER BY c.course_name;

-- QUERY 4: Count enrollments for each course
SELECT
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM courses c
LEFT JOIN enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_enrollments DESC;

-- QUERY 5: Calculate average score for each student
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    ROUND(AVG(r.score), 2) AS average_score
FROM students s
LEFT JOIN results r
    ON s.student_id = r.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY average_score DESC NULLS LAST;

-- QUERY 6: Identify students scoring 80 or above
SELECT
    s.first_name,
    s.last_name,
    a.assessment_name,
    r.score
FROM results r
JOIN students s
    ON r.student_id = s.student_id
JOIN assessments a
    ON r.assessment_id = a.assessment_id
WHERE r.score >= 80
ORDER BY r.score DESC;

-- QUERY 7: Find the highest assessment scores
SELECT
    a.assessment_name,
    MAX(r.score) AS highest_score
FROM assessments a
LEFT JOIN results r
    ON a.assessment_id = r.assessment_id
GROUP BY a.assessment_id, a.assessment_name
ORDER BY highest_score DESC NULLS LAST;

-- QUERY 8: Display the complete student enrollment report
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    e.enrollment_date,
    e.status
FROM enrollments e
JOIN students s
    ON e.student_id = s.student_id
JOIN courses c
    ON e.course_id = c.course_id
ORDER BY s.last_name, c.course_name;
