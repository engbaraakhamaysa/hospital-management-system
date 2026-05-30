CREATE TABLE medical_tests(

    id SERIAL PRIMARY KEY,

    test_name VARCHAR(50) NOT NULL,

    result TEXT NOT NULL,

    price NUMERIC(10,2) NOT NULL,

    
    appointment_id INTEGER NOT NULL,

    CONSTRAINT fk_medical_test_appointment
    FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);