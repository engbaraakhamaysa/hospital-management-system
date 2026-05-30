CREATE TABLE patients (

    id SERIAL PRIMARY KEY,

    full_name VARCHAR(100) NOT NULL,

    blood_type VARCHAR(3) CHECK (
        blood_type IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')
    ),

    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female')),

    birth_date DATE,

    address VARCHAR(50),

    phone VARCHAR(20),

    email VARCHAR(50) UNIQUE

);