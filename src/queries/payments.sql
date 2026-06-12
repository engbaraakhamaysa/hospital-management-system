-- =========================================
-- 1. CREATE PAYMENT (INSERT)
-- =========================================
-- Add new payments for appointments
INSERT INTO payments
(amount, payment_method, status, payment_date, appointment_id)
VALUES
(220.00, 'Card', 'Paid', '2026-06-01 09:30:00', 1),
(180.00, 'Cash', 'Paid', '2026-06-01 10:30:00', 2);


-- =========================================
-- 2. READ PAYMENTS
-- =========================================

-- Get all payments
SELECT * FROM payments;

-- Get payment by ID
SELECT * FROM payments
WHERE id = 5;


-- =========================================
-- 3. UPDATE PAYMENT
-- =========================================
-- Update payment status
UPDATE payments
SET status = 'Pending'
WHERE id = 5
RETURNING *;


-- =========================================
-- 4. DELETE PAYMENT
-- =========================================
-- Delete payment by ID
DELETE FROM payments
WHERE id = 5;


-- =========================================
-- 5. FILTER PAYMENTS
-- =========================================

-- Get payments by status
SELECT *
FROM payments
WHERE status LIKE 'Pending';

-- Get payments by method
SELECT *
FROM payments
WHERE payment_method LIKE 'Cash';


-- =========================================
-- 6. PAYMENT REPORTS
-- =========================================

-- Total hospital income
SELECT
    SUM(amount) AS total_amount
FROM payments;

-- Monthly revenue report
SELECT
    DATE_TRUNC('month', payment_date) AS month,
    SUM(amount) AS total_revenue
FROM payments
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;

-- Failed payments report
SELECT *
FROM payments
WHERE status LIKE 'Failed';

-- Revenue grouped by status
SELECT
    status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY status;


-- =========================================
-- 7. PAYMENTS WITH RELATIONS
-- =========================================

-- Payment with appointment details
SELECT
    p.amount,
    p.status,
    p.payment_date,
    a.appointment_datetime
FROM payments p
INNER JOIN appointments a
    ON p.appointment_id = a.id;

-- Payment with doctors
SELECT
    d.full_name AS doctor,
    p.amount,
    p.status,
    p.payment_date,
    a.appointment_datetime
FROM payments p
INNER JOIN appointments a
    ON p.appointment_id = a.id
INNER JOIN doctors d
    ON a.doctor_id = d.id;

-- Payment with patients
SELECT
    pa.full_name AS patient,
    p.amount,
    p.status,
    p.payment_date,
    a.appointment_datetime
FROM payments p
INNER JOIN appointments a
    ON p.appointment_id = a.id
INNER JOIN patients pa
    ON a.patient_id = pa.id;


-- =========================================
-- 8. FINANCIAL DASHBOARD
-- =========================================
-- Full financial system report (payments + appointments + doctors + patients)

SELECT
    p.amount,
    p.status,
    p.payment_date,
    a.appointment_datetime,
    d.full_name AS doctor,
    pa.full_name AS patient
FROM payments p
INNER JOIN appointments a
    ON p.appointment_id = a.id
INNER JOIN doctors d
    ON a.doctor_id = d.id
INNER JOIN patients pa
    ON a.patient_id = pa.id;