-- =========================================
-- 1. CREATE APPOINTMENT (INSERT)
-- =========================================
-- Add new appointments into the system
INSERT INTO appointments
(appointment_datetime, status, notes, doctor_id, patient_id)
VALUES
('2026-06-11 09:00:00', 'Completed', 'Child vaccination', 6, NUll),
('2026-06-11 10:00:00', 'Pending', 'Pediatric consultation', 6, NULL),
('2026-06-11 11:00:00', 'Cancelled', 'Future reservation slot', 6, NULL)
RETURNING *;


-- =========================================
-- 2. READ APPOINTMENTS
-- =========================================

-- Get all appointments
SELECT * FROM appointments;

-- Get appointment by ID
SELECT * FROM appointments
WHERE id = 32;


-- =========================================
-- 3. UPDATE APPOINTMENT
-- =========================================
-- Update appointment status
UPDATE appointments
SET status = 'Cancelled'
WHERE id= 32
RETURNING *;


-- =========================================
-- 4. DELETE APPOINTMENT
-- =========================================
-- Delete appointment by ID
DELETE FROM appointments
WHERE id = 32
RETURNING id;


-- =========================================
-- 5. APPOINTMENTS BY RELATIONSHIPS
-- =========================================

-- Get appointments with doctor information
SELECT *
FROM appointments
INNER JOIN doctors
ON doctors.id = appointments.doctor_id;

-- Get appointments with patient information
SELECT *
FROM appointments
INNER JOIN patients
ON patients.id = appointments.patient_id;


-- =========================================
-- 6. DATE FILTERING
-- =========================================

-- Get today's appointments
SELECT *
FROM appointments
WHERE DATE(appointment_datetime) = CURRENT_DATE;

-- Get upcoming appointments using date comparison
SELECT *
FROM appointments
WHERE DATE(appointment_datetime) > CURRENT_DATE;

-- Get upcoming appointments using current timestamp
SELECT *
FROM appointments
WHERE appointment_datetime > NOW()
ORDER BY appointment_datetime;


-- =========================================
-- 7. APPOINTMENT REPORTS
-- =========================================

-- Count appointments per doctor
SELECT
    doctor_id,
    (
        SELECT full_name
        FROM doctors d
        WHERE d.id = a.doctor_id
    ) AS doctor_name,
    COUNT(*) AS total_appointments
FROM appointments a
GROUP BY doctor_id
ORDER BY total_appointments DESC;


-- =========================================
-- 8. PATIENT APPOINTMENT HISTORY
-- =========================================
-- Show full appointment history for a patient
SELECT
    (
        SELECT full_name
        FROM patients
        WHERE id = a.patient_id
    ) AS patient,

    (
        SELECT full_name
        FROM doctors
        WHERE id = a.doctor_id
    ) AS doctor,

    a.appointment_datetime
FROM appointments a
WHERE a.patient_id = 1
ORDER BY a.appointment_datetime;


-- =========================================
-- 9. APPOINTMENTS WITH DOCTORS
-- =========================================
-- Display appointment time with assigned doctor
SELECT 
        a.appointment_datetime AS time,
        d.full_name AS doctor
FROM appointments a
INNER JOIN doctors d
ON a.doctor_id = d.id;


-- =========================================
-- 10. APPOINTMENTS WITH PATIENTS
-- =========================================
-- Display appointment time with patient information
SELECT 
        a.appointment_datetime AS time,
        p.full_name AS patients
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.id;


-- =========================================
-- 11. FULL APPOINTMENT DETAILS
-- =========================================
-- Display appointment, doctor, and patient details
SELECT 
        a.appointment_datetime AS time,
        d.full_name AS doctor,
        p.full_name AS patients
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.id
INNER JOIN doctors d
ON a.doctor_id = d.id;


-- =========================================
-- 12. APPOINTMENTS WITH PAYMENTS
-- =========================================
-- Display payment information related to appointments
SELECT 
        a.appointment_datetime,
        p.amount
FROM appointments a
INNER JOIN payments p
ON p.appointment_id = a.id;


-- =========================================
-- 13. APPOINTMENTS WITH MEDICAL TESTS
-- =========================================
-- Display medical tests linked to appointments
SELECT 
        a.appointment_datetime,
        m.test_name
FROM appointments a
INNER JOIN medical_tests m
ON m.appointment_id = a.id;


-- =========================================
-- 14. APPOINTMENTS WITH PRESCRIPTIONS
-- =========================================
-- Display prescriptions issued during appointments
SELECT 
        a.appointment_datetime,
        p.medication_name
FROM appointments a
INNER JOIN prescriptions p
ON p.appointment_id = a.id;