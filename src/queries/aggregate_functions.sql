
-- Number patients
SELECT COUNT(*) AS total_patients
FROM patients;

-- Patients who have phone
SELECT COUNT(phone) AS patients_phone
FROM patients;


-- Number of appointments for each doctor
SELECT 
    doctor_id,
    COUNT(*) AS total_patients
FROM appointments
GROUP BY doctor_id;

SELECT
    d.full_name,
    COUNT(*) AS total_appointments
FROM doctors d
JOIN appointments a
    ON d.id = a.doctor_id
GROUP BY d.full_name;

-- Number of appintments by status
SELECT 
    status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY status;

-- Number of appointments by status ordered descending
SELECT 
    status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY status
ORDER BY total_appointments;

-- Total payments
SELECT 
    SUM(amount) AS total_revenue
FROM payments;

-- Total paid revenue
SELECT 
    SUM(amount) AS total_revenue
FROM payments
WHERE status = 'Paid';


-- Average doctor salary
SELECT 
    AVG(salary) AS average_salary
FROM doctors;

-- Average medical test price
SELECT 
    AVG(price) AS average_test_price
FROM medical_tests;

-- Appointment status appearing more than once
SELECT
    status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY status
HAVING COUNT(*) > 5;

-- Doctors with more than 10 appointments
SELECT 
    doctor_id,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > 3;


SELECT COUNT(*) AS total_appointments
FROM appointments
HAVING COUNT(*) > 10;

-- WHERE    -> Filters rows before grouping
-- GROUP BY -> Groups rows together
-- HAVING   -> Filters groups after grouping


-- Highest doctor salary
SELECT MAX(salary) AS highest_salary
FROM doctors;

-- Lowest doctor salary
SELECT MIN(salary) AS lowest_salary
FROM doctors;