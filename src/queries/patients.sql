-- =========================================
-- 1. CREATE PATIENT (INSERT)
-- =========================================
-- Add new patients into the system
INSERT INTO patients
(full_name, blood_type, gender, birth_date, address, phone, email)
VALUES
('Baraa Khamaysa', 'A+', 'Male', '2000-06-16', 'Jenin', '0568230334', 'bbaraa@gmail.com'),
('Khamaysa Khamaysa', 'A+', 'Male', '2000-06-16', 'Jenin', '0568230334', 'bbadraa@gmail.com')
RETURNING *;


-- =========================================
-- 2. READ PATIENTS
-- =========================================
-- Get all patients
SELECT * FROM patients;


-- Get single patient by ID
SELECT *
FROM patients
WHERE id = 54;


-- =========================================
-- 3. UPDATE PATIENT
-- =========================================
-- Update patient information
UPDATE patients
SET full_name = 'Ahmed Khamaysa',
    blood_type = 'A-'
WHERE id = 54
RETURNING *;


-- =========================================
-- 4. DELETE PATIENT
-- =========================================
-- Remove patient by ID
DELETE FROM patients
WHERE id = 54
RETURNING full_name;


-- =========================================
-- 5. SEARCH & FILTER PATIENTS
-- =========================================

-- Search patient by name
SELECT *
FROM patients
WHERE full_name LIKE 'Baraa%';


-- Filter patients by blood type
SELECT *
FROM patients
WHERE blood_type = 'A+';


-- =========================================
-- 6. PATIENT STATISTICS
-- =========================================

-- Count total patients
SELECT COUNT(id) AS total_patients
FROM patients;


-- Calculate patient age
SELECT
    full_name,
    EXTRACT(YEAR FROM AGE(birth_date))::INT AS age
FROM patients;


-- =========================================
-- 7. PATIENT APPOINTMENTS (JOIN TYPES)
-- =========================================

-- INNER JOIN
-- Patients who have appointments only
SELECT
    p.full_name AS patient,
    a.appointment_datetime
FROM patients p
INNER JOIN appointments a
ON p.id = a.patient_id;


-- LEFT JOIN
-- All patients, even without appointments
SELECT
    p.full_name AS patient,
    a.appointment_datetime
FROM patients p
LEFT JOIN appointments a
ON p.id = a.patient_id;


-- RIGHT JOIN
-- All appointments, even if patient record is missing
SELECT
    p.full_name AS patient,
    a.appointment_datetime
FROM patients p
RIGHT JOIN appointments a
ON p.id = a.patient_id;


-- FULL JOIN
-- All patients and all appointments
SELECT
    p.full_name AS patient,
    a.appointment_datetime
FROM patients p
FULL OUTER JOIN appointments a
ON p.id = a.patient_id;


-- =========================================
-- 8. PATIENTS WITH DOCTORS
-- =========================================
-- Show patient and assigned doctor
SELECT
    p.full_name AS patient,
    d.full_name AS doctor
FROM patients p
INNER JOIN appointments a
ON p.id = a.patient_id
INNER JOIN doctors d
ON d.id = a.doctor_id;


-- =========================================
-- 9. PATIENT MEDICAL HISTORY
-- =========================================
-- Show patient medical timeline
SELECT
    p.full_name,
    a.appointment_datetime AS medical_timeline
FROM patients p
INNER JOIN appointments a
ON p.id = a.patient_id
INNER JOIN medical_tests m
ON a.id = m.appointment_id;


-- =========================================
-- 10. PATIENT PRESCRIPTIONS
-- =========================================
-- Show medications prescribed to patients
SELECT
    p.full_name,
    pr.medication_name
FROM patients p
INNER JOIN appointments a
ON p.id = a.patient_id
INNER JOIN prescriptions pr
ON a.id = pr.appointment_id;


-- =========================================
-- 11. PATIENT MEDICAL TESTS
-- =========================================
-- Show all medical tests and results
SELECT
    p.full_name,
    m.test_name,
    m.result
FROM patients p
INNER JOIN appointments a
ON p.id = a.patient_id
INNER JOIN medical_tests m
ON a.id = m.appointment_id;


-- =========================================
-- 12. PATIENT ACTIVITY REPORT
-- =========================================
-- Patients sorted by number of appointments
SELECT
    p.full_name,
    COUNT(a.id) AS total_appointments
FROM patients p
LEFT JOIN appointments a
ON p.id = a.patient_id
GROUP BY p.id, p.full_name
ORDER BY total_appointments DESC;


-- =========================================
-- 13. SUBQUERY - PATIENTS WITH APPOINTMENTS
-- =========================================
-- Get patients who have at least one appointment
SELECT full_name
FROM patients
WHERE id IN (
    SELECT patient_id
    FROM appointments
);


-- =========================================
-- 14. SUBQUERY - APPOINTMENT COUNT
-- =========================================
-- Count appointments for each patient
SELECT
    p.full_name,
    (
        SELECT COUNT(*)
        FROM appointments a
        WHERE a.patient_id = p.id
    ) AS total_appointments
FROM patients p;


-- =========================================
-- 15. TOP ACTIVE PATIENTS
-- =========================================
-- Top 5 patients by number of appointments
SELECT
    p.full_name,
    COUNT(a.id) AS total_visits
FROM patients p
LEFT JOIN appointments a
ON p.id = a.patient_id
GROUP BY p.id, p.full_name
ORDER BY total_visits DESC
LIMIT 5;