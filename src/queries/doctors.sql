-- =========================================
-- 1. CREATE DOCTORS (INSERT)
-- =========================================
INSERT INTO doctors
(full_name, email, gender, salary, specialization, phone, department_id)
VALUES
('Dr. baraa Khalil', 'baraa.khalil3@gmail.com', 'Male', 8100.00, 'Cardiology Consultant', '0599011003', 1),
('Dr. baraa Ahmad', 'baraa.ahmad@gmail.com', 'Male', 9000.00, 'Cardiology Consultant', '0599021003', 1),
('Dr. Sobhi Khamaysa', 'sobhi.khamaysa@gmail.com', 'Male', 2100.00, 'Cardiology Consultant', '0599031003', 1),
('Dr. Ahmed Nasser', 'ahmed.nasser@gmail.com', 'Male', 9100.00, 'Emergency Medicine', '0599001122', 5),
('Dr. Lina Saeed', 'lina.saeed@gmail.com', 'Female', 8500.00, 'Emergency Medicine', '0599112233', 5),
('Dr. Omar Yassin', 'omar.yassin@gmail.com', 'Male', 9200.00, 'Emergency Medicine', '0599223344', 5),
('Dr. Sara Khalil', 'sara.khalil@gmail.com', 'Female', 8800.00, 'Emergency Medicine', '0599334455', 5)
RETURNING *;


-- =========================================
-- 2. READ DOCTORS
-- =========================================

-- Get all doctors
SELECT * FROM doctors;

-- Get doctor by ID
SELECT * FROM doctors
WHERE id = 5;


-- =========================================
-- 3. UPDATE DOCTOR
-- =========================================

UPDATE doctors
SET full_name = 'Dr Baraa Ahmad',
    phone = '0568882302'
WHERE id = 14
RETURNING *;


-- =========================================
-- 4. DELETE DOCTOR
-- =========================================

DELETE FROM doctors
WHERE id = 15
RETURNING *;


-- =========================================
-- 5. FILTER & SEARCH DOCTORS
-- =========================================

-- Filter by department
SELECT * FROM doctors
WHERE department_id = 1;

-- Search by name
SELECT * FROM doctors
WHERE full_name LIKE '%baraa%';

-- Filter by specialization
SELECT * FROM doctors
WHERE specialization = 'Emergency Medicine'
LIMIT 2;


-- =========================================
-- 6. DOCTOR STATISTICS
-- =========================================

-- Count doctors by specialization
SELECT 
    specialization,
    COUNT(*) AS specialization_number
FROM doctors
GROUP BY specialization;


-- =========================================
-- 7. SALARY REPORT
-- =========================================

SELECT 
    department_id,
    SUM(salary) AS total_salary,
    ROUND(AVG(salary), 2) AS average_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM doctors
GROUP BY department_id;


-- =========================================
-- 8. DOCTORS PER DEPARTMENT
-- =========================================

SELECT
    p.name AS department_name,
    STRING_AGG(d.full_name, ', ') AS doctors
FROM departments p
LEFT JOIN doctors d
ON d.department_id = p.id
GROUP BY p.name;


-- =========================================
-- 9. DOCTOR SCHEDULE REPORT
-- =========================================

SELECT 
    d.full_name AS doctor_name,
    a.appointment_datetime,
    a.status,
    a.id AS appointment_id
FROM doctors d
JOIN appointments a
ON a.doctor_id = d.id
ORDER BY d.full_name, a.appointment_datetime;


-- =========================================
-- 10. PATIENTS PER DOCTOR
-- =========================================

SELECT 
    d.full_name AS doctor,
    p.full_name AS patient,
    a.appointment_datetime
FROM doctors d
JOIN appointments a
ON a.doctor_id = d.id
JOIN patients p
ON p.id = a.patient_id;


-- =========================================
-- 11. DOCTOR REVENUE REPORT
-- =========================================

SELECT
    d.full_name,
    SUM(p.amount) AS total_income
FROM doctors d
JOIN appointments a
    ON a.doctor_id = d.id
JOIN payments p
    ON p.appointment_id = a.id
GROUP BY d.full_name;


-- =========================================
-- 12. FULL DOCTOR TIMETABLE
-- =========================================

SELECT
    d.full_name AS doctor_name,
    a.appointment_datetime,
    a.status,
    a.id AS appointment_id
FROM doctors d
JOIN appointments a
ON a.doctor_id = d.id
ORDER BY d.full_name, a.appointment_datetime;