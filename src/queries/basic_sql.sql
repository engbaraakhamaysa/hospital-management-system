
-- Display all patients
SELECT * FROM patients;

-- Display all Names Doctor
SELECT full_name AS name_doctor
FROM doctors;

-- Search patient by full name
SELECT * FROM patients
WHERE full_name = 'Tareq Amro';

-- Search patients whose name contains Ahmad
SELECT * FROM patients
WHERE full_name LIKE '%Ahmad%';

-- Update patient phone number
UPDATE patients
SET phone = '0591234567'
WHERE id = 5
RETURNING *;

-- Delete appointment with id 10
DELETE FROM appointments
WHERE id = 10;

-- Delete cancelled appointments
SELECT *
FROM appointments
WHERE status = 'Cancelled';

DELETE FROM appointments
WHERE status = 'Cancelled';

-- Order doctors by name
SELECT * FROM doctors
ORDER BY full_name;

-- Order doctors by salary descending
SELECT * FROM doctors
ORDER BY salary DESC;

-- Order appointments by date descending
SELECT * FROM appointments
ORDER BY appointment_datetime DESC;

-- Display first 5 doctors
SELECT * FROM doctors
LIMIT 5;

-- Top 3 highest paid doctors
SELECT 
    full_name AS name,
    salary
FROM doctors
ORDER BY salary DESC
LIMIT 3;

-- Latest 10 appointments
SELECT * FROM appointments
ORDER BY appointment_datetime DESC
LIMIT 5;

-- Unique doctor specializations
SELECT DISTINCT specialization , department_id
FROM doctors;

-- Unique blood type
SELECT DISTINCT blood_type
FROM patients;

-- Doctors in specific specializations
SELECT * FROM doctors
WHERE specialization = 'Dermatologist'
   OR specialization = 'Bone Specialist'
   OR specialization = 'Pediatrician';

SELECT * FROM doctors
WHERE specialization IN('Dermatologist','Bone Specialist');

-- Appointments with specific statuses
SELECT * FROM appointments
WHERE status IN('Pending','Cancelled');

-- Display patient with specific ID 
SELECT * FROM patients
WHERE id IN(1,4,5);

-- Doctors with salary between 3000 and 7000
SELECT * FROM doctors
WHERE salary >= 3000 AND salary <= 7000;

SELECT * FROM doctors
WHERE salary BETWEEN 3000 AND 7000;

-- Appointments in a date range 
SELECT * FROM appointments
WHERE appointment_datetime BETWEEN '2026-06-01' AND '2026-06-03';

-- Patients ID range
SELECT * FROM patients
WHERE id BETWEEN 10 AND 15;

-- Patients without patient_id
SELECT * FROM appointments
WHERE patient_id IS NULL;

-- patient with patient_id
SELECT * FROM appointments
WHERE patient_id IS NOT NULL;

-- Insert new patient
INSERT INTO patients(full_name, gender, phone, email)
VALUES ('Baraa Khamaysa', 'Male', '0599999999', 'baraa@gmail.com')
RETURNING *;

SELECT * FROM patients;

UPDATE patients
SET address='jenin', blood_type ='A+' , birth_date='2000-06-16'
WHERE id = 52
RETURNING *;



