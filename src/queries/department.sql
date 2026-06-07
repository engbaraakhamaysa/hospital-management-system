-- =========================================
-- 1. CREATE DEPARTMENT (INSERT)
-- =========================================
-- Add new departments into the system
INSERT INTO departments(name, description, location)
VALUES
('Emergency', 'Emergency and urgent medical care', 'Building A - Ground Floor'),
('Oncology', 'Cancer diagnosis and treatment department', 'Building C - Floor 2')
RETURNING *;


-- =========================================
-- 2. READ DEPARTMENTS
-- =========================================
-- Get all departments
SELECT * FROM departments;


-- Get single department by ID
SELECT * FROM departments
WHERE id = 1;


-- =========================================
-- 3. UPDATE DEPARTMENT
-- =========================================
-- Update department location or details
UPDATE departments
SET location = 'Building B - Floor 3'
WHERE id = 2
RETURNING *;


-- =========================================
-- 4. DELETE DEPARTMENT
-- =========================================
-- Remove department by name
DELETE FROM departments
WHERE name = 'Oncology'
RETURNING *;


-- =========================================
-- 5. SEARCH DEPARTMENTS
-- =========================================
-- Search departments by name (partial match)
SELECT * FROM departments
WHERE name LIKE '%a%';


-- =========================================
-- 6. DOCTORS PER DEPARTMENT (JOIN TYPES)
-- =========================================

-- RIGHT JOIN
-- Shows all doctors (even without departments)
-- Departments without doctors are not shown
SELECT
    p.name,
    COUNT(d.id) AS total_doctor
FROM departments p
RIGHT JOIN doctors d
ON p.id = d.department_id
GROUP BY p.name;


-- FULL JOIN
-- Shows all departments + all doctors
-- Unmatched rows from both sides included
SELECT
    p.name,
    COUNT(d.id) AS total_doctor
FROM departments p
FULL JOIN doctors d
ON p.id = d.department_id
GROUP BY p.name;

-- INNER JOIN
-- Shows only departments that have doctors
SELECT
    p.name,
    COUNT(d.id) AS total_doctor
FROM departments p
INNER JOIN doctors d
ON p.id = d.department_id
GROUP BY p.name;


-- =========================================
-- 7. DEPARTMENT PERFORMANCE REPORT
-- =========================================
-- Departments sorted by number of doctors
SELECT
    p.name AS department,
    COUNT(d.id) AS total_doctors
FROM departments p
LEFT JOIN doctors d
ON p.id = d.department_id
GROUP BY p.name
ORDER BY total_doctors DESC;


-- =========================================
-- 8. DEPARTMENT DETAILED VIEW
-- =========================================
-- Show department with all doctors inside it
SELECT 
    p.name AS department,
    p.location,
    d.full_name AS doctor,
    d.specialization
FROM departments p
LEFT JOIN doctors d
ON p.id = d.department_id
ORDER BY p.name;


-- =========================================
-- 9. SUBQUERY - DEPARTMENTS WITH DOCTORS
-- =========================================
-- Get departments that have at least one doctor
SELECT name
FROM departments
WHERE id IN (
    SELECT department_id
    FROM doctors
);


-- =========================================
-- 10. SUBQUERY - COUNT DOCTORS (NO JOIN)
-- =========================================
-- Count doctors per department using subquery
SELECT
    d.name,
    (
        SELECT COUNT(*)
        FROM doctors doc
        WHERE doc.department_id = d.id
    ) AS total_doctors
FROM departments d;


-- =========================================
-- 11. TOP DEPARTMENTS
-- =========================================
-- Get top 3 departments by number of doctors
SELECT
    d.name,
    COUNT(doc.id) AS total
FROM departments d
LEFT JOIN doctors doc
ON d.id = doc.department_id
GROUP BY d.name
ORDER BY total DESC
LIMIT 3;