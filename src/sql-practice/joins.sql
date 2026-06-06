-- Doctors with department name
SELECT
    doctors.full_name,
    doctors.specialization,
    departments.name AS department_name
FROM doctors
INNER JOIN departments
on doctors.department_id = departments.id;

-- Appointments with doctor and patient names
SELECT 
    a.id,
    a.appointment_datetime,
    a.status,

    d.full_name AS doctor_name,
    p.full_name AS patient_name

FROM appointments a
INNER JOIN doctors d
    On a.doctor_id = d.id

INNER JOIN patients p
    ON a.patient_id = p.id;

-- ALL appointment evene if patient or doctor missing
SELECT 
    a.id,
    a.appointment_datetime,
    a.status,
    d.full_name AS doctor_name,
    p.full_name AS patient_name

FROM appointments a
LEFT JOIN doctors d
    ON a.doctor_id = d.id

LEFT JOIN patients p
    ON a.patient_id = p.id;

-- Number of appointments per doctor
SELECT 
    doctors.full_name AS doctor_name,
    COUNT(appointments.id) AS total_appointments
FROM doctors
LEFT JOIN appointments
    ON doctors.id = appointments.doctor_id
GROUP BY doctors.full_name;


-- Appointments by status
SELECT 
    status,
    COUNT(*) AS total
FROM appointments
GROUP BY status;

-- Most busy doctor
SELECT 
    doctors.full_name AS doctor_name,
    COUNT(appointments.id) AS total_appointments
FROM doctors
LEFT JOIN appointments
    ON doctors.id = appointments.doctor_id
GROUP BY doctors.full_name
ORDER BY total_appointments DESC
LIMIT 1;

-- View doctor appointments with patient data + appointment status
SELECT
    d.full_name AS doctor_name,
    p.full_name AS patient_name,
    a.appointment_datetime,
    a.status
FROM appointments a

INNER JOIN doctors d
    ON a.doctor_id = d.id

INNER JOIN patients p
    ON a.patient_id = p.id;

-- View all patient, even without appointments.
SELECT 
    p.full_name AS name,
    a.appointment_datetime
FROM patients p
    
LEFT JOIN appointments a
    ON p.id = a.patient_id;

-- Patients with appointments only
SELECT 
    p.full_name AS name,
    a.appointment_datetime
FROM patients p
    
INNER JOIN appointments a
    ON p.id = a.patient_id;

--Number of appointments per patient
SELECT 
    p.full_name AS patient_name,
    COUNT(a.id) AS total_appointments
FROM patients p

LEFT JOIN appointments a
    ON p.id = a.patient_id
GROUP BY p.id;


-- Linking appointments + doctor + patient + department
SELECT 
    a.id AS appointment_id,
    a.appointment_datetime,
    
    d.full_name AS doctor_name,
    d.specialization,

    p.full_name AS patient_name,

    dep.name AS department_name

FROM appointments a
INNER JOIN doctors d
    ON a.doctor_id = d.id
INNER JOIN patients p
    ON a.patient_id = p.id
INNER JOIN departments dep
    ON d.department_id = dep.id;


SELECT *
FROM doctors
RIGHT JOIN appointments
ON doctors.id = appointments.doctor_id;

SELECT *
FROM patients
FULL OUTER JOIN appointments
ON patients.id = appointments.patient_id;

SELECT *
FROM doctors
CROSS JOIN appointments;