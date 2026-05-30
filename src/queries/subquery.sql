-- Doctor with highest salary
SELECT * FROM doctors
WHERE salary = (
    SELECT MAX(salary)
    FROM doctors
);

-- Patient with most appointments
SELECT *
FROM patients
WHERE id = (
    SELECT patient_id
    FROM appointments
    GROUP BY patient_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Department with most doctors
SELECT *
FROM departments
WHERE id = (
    SELECT department_id
    FROM doctors
    GROUP BY department_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT 
    d.id,
    d.name,
    COUNT(doc.id) AS total_doctors
FROM departments d
JOIN doctors doc
    ON d.id = doc.department_id
GROUP BY d.id, d.name
ORDER BY total_doctors DESC
LIMIT 1;

-- View doctors with appointments
SELECT *
FROM doctors
WHERE id IN (
    SELECT doctor_id
    FROM appointments
);

--Doctors who have no appointments
SELECT *
FROM doctors
WHERE id NOT IN (
    SELECT doctor_id
    FROM appointments
);

--View each doctor + number of appointments
SELECT 
    full_name,
    (
        SELECT COUNT(*)
        FROM appointments
        WHERE appointments.doctor_id = doctors.id
    ) AS total_appointments
FROM doctors;