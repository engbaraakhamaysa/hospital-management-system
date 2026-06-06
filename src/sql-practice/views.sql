-- Appointments view
CREATE VIEW v_appointments AS
SELECT 
    a.id AS appointment_id,
    a.appointment_datetime,
    a.status,
    d.full_name AS doctor_name,
    p.full_name AS patient_name
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
JOIN patients p ON a.patient_id = p.id;

-- Financial report view
CREATE VIEW v_financial_report AS
SELECT 
    payment_method,
    SUM(amount) AS total_amount
FROM payments
WHERE status = 'Paid'
GROUP BY payment_method;

-- Clinic overview view
CREATE VIEW v_clinic_overview AS
SELECT 
    a.id AS appointment_id,
    a.appointment_datetime,
    a.status,
    d.full_name AS doctor_name,
    p.full_name AS patient_name,
    pay.amount,
    pay.status AS payment_status
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
JOIN patients p ON a.patient_id = p.id
LEFT JOIN payments pay ON pay.appointment_id = a.id;