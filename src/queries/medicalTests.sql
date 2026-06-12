
-- CReate Medical Test
INSERT INTO medical_tests 
(test_name, result, price, appointment_id)
VALUES
('Heart Echo', 'Mild valve issue detected', 200.00, 1),
('Stress Test', 'Patient stable', 180.00, 1),
('Vitamin D Test', 'Severe deficiency', 45.00, 1)
RETURNING *;

-- Get All Medical Tests
SELECT * FROM medical_tests;

-- Get Medical Test By ID
SELECT * FROM medical_tests
WHERE id = 1;