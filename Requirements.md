# Hospital Management System

## Database Requirements & Query Checklist (DETAILED - NO SOLUTIONS)

---

# 1. Departments

## Primary Requirements (Core System)

➡ Purpose: Manage hospital departments

- Create Department  
  → Add a new department (name, description, location)

- Get All Departments  
  → Retrieve all departments in the system

- Get Department By ID  
  → Retrieve a single department by its ID

- Update Department  
  → Modify department details

- Delete Department  
  → Remove a department (only if no doctors are assigned)

---

## Secondary Requirements (Business Logic)

➡ Purpose: Analytics & search

- Count Doctors Per Department  
  → Show how many doctors belong to each department

- Search Department By Name  
  → Search departments using partial name matching

---

## JOIN Requirements (Relational Data)

➡ Purpose: Connect departments with other tables

- Departments with Doctors (One-to-Many)
  → List all departments with their doctors

- Department Performance Report
  → Analyze departments based on doctor count

- Department Detailed View
  → Show department + all related doctors

---

# 2. Doctors

## Primary Requirements (Core System)

➡ Purpose: Manage doctors

- Create Doctor  
  → Add doctor (name, specialization, department, salary)

- Get All Doctors  
  → Retrieve all doctors

- Get Doctor By ID  
  → Retrieve specific doctor details

- Update Doctor  
  → Update doctor information

- Delete Doctor  
  → Remove doctor (if no related appointments exist)

---

## Secondary Requirements (Business Logic)

- Get Doctors By Department  
  → Filter doctors by department

- Search Doctor By Name  
  → Search doctor using name

- Search Doctor By Specialization  
  → Filter doctors by specialization

- Count Doctors  
  → Get total number of doctors

- Doctor Salary Report  
  → Generate salary summary report

---

## JOIN Requirements

➡ Purpose: Relationship-based insights

- Doctors with Departments  
  → Show which department each doctor belongs to

- Doctors with Appointments  
  → Show doctor schedules

- Doctors with Patients (Indirect via Appointments)  
  → Patients treated by each doctor

- Doctors Revenue Report (via Payments)  
  → Total income per doctor

- Doctor Full Schedule Report  
  → Complete timetable of doctor activities

---

# 3. Patients

## Primary Requirements (Core System)

➡ Purpose: Manage patients

- Create Patient  
  → Add new patient

- Get All Patients  
  → Retrieve all patients

- Get Patient By ID  
  → Retrieve specific patient

- Update Patient  
  → Update patient information

- Delete Patient  
  → Remove patient record

---

## Secondary Requirements (Business Logic)

- Search Patient By Name  
  → Search patients by name

- Search Patient By Blood Type  
  → Filter patients by blood type

- Search Patient By Email  
  → Find patient by email

- Count Patients  
  → Total number of patients

- Get Patient Age  
  → Calculate patient age from birth date

---

## JOIN Requirements

➡ Purpose: Medical history tracking

- Patients with Appointments  
  → All appointments per patient

- Patients with Doctors (Indirect)  
  → Doctors who treated the patient

- Patients Medical History  
  → Full medical timeline

- Patients with Prescriptions  
  → Medications prescribed

- Patients with Medical Tests  
  → Lab tests and results

---

# 4. Appointments

## Primary Requirements (Core System)

➡ Purpose: Appointment management

- Create Appointment  
  → Book a new appointment

- Get All Appointments  
  → Retrieve all appointments

- Get Appointment By ID  
  → Retrieve specific appointment

- Update Appointment  
  → Modify appointment details

- Cancel Appointment  
  → Mark appointment as cancelled

- Delete Appointment  
  → Remove appointment record

---

## Secondary Requirements

- Get Appointments By Doctor  
  → Filter by doctor

- Get Appointments By Patient  
  → Filter by patient

- Get Today's Appointments  
  → Show current day schedule

- Get Upcoming Appointments  
  → Future appointments

- Count Appointments Per Doctor  
  → Workload per doctor

- Appointment History For Patient  
  → Full appointment history

---

## JOIN Requirements

➡ Purpose: Full relationship mapping

- Appointments with Doctor  
  → Link appointment to doctor

- Appointments with Patient  
  → Link appointment to patient

- Full Appointment Details  
  → Doctor + Patient + Appointment data

- Appointments with Payments  
  → Payment status per appointment

- Appointments with Medical Tests  
  → Tests linked to appointment

- Appointments with Prescriptions  
  → Prescribed medications per visit

---

# 5. Medical Tests

## Primary Requirements

- Create Medical Test
- Get All Medical Tests
- Get Medical Test By ID
- Update Medical Test
- Delete Medical Test

---

## Secondary Requirements

- Get Tests For Appointment  
  → Tests linked to appointment

- Calculate Total Test Revenue  
  → Total income from tests

- Search Test By Name  
  → Search tests using name

---

## JOIN Requirements

- Medical Tests with Appointments  
  → Link tests to appointments

- Medical Tests with Patients (Indirect)  
  → Identify patient per test

- Medical Tests Full Report  
  → Complete test analysis report

---

# 6. Prescriptions

## Primary Requirements

- Create Prescription
- Get All Prescriptions
- Get Prescription By ID
- Update Prescription
- Delete Prescription

---

## Secondary Requirements

- Get Prescriptions For Appointment  
  → Medications per visit

- Search Medication  
  → Find medication records

- Count Prescriptions  
  → Total prescriptions in system

---

## JOIN Requirements

- Prescriptions with Appointments  
  → Link prescriptions to visits

- Prescriptions with Patients (Indirect)  
  → Medications per patient

- Full Medical Record View  
  → Complete patient treatment record

---

# 7. Payments

## Primary Requirements

- Create Payment
- Get All Payments
- Get Payment By ID
- Update Payment Status
- Delete Payment

---

## Secondary Requirements

- Get Payments By Status  
  → Paid / Pending / Failed

- Get Payments By Method  
  → Cash / Card / Insurance

- Calculate Total Revenue  
  → Total hospital income

- Monthly Revenue Report  
  → Income per month

- Failed Payments  
  → Unsuccessful transactions

---

## JOIN Requirements

- Payments with Appointments  
  → Payment per appointment

- Payments with Doctors (Indirect)  
  → Doctor income tracking

- Payments with Patients (Indirect)  
  → Patient payment history

- Financial Dashboard  
  → Full financial system report

---

# Advanced System Reports

➡ Global analytics across system

- Doctor Schedule Report
- Patient Medical History Report
- Revenue Dashboard
- Most Busy Doctors Report
- Department Performance Report
- Full Hospital Overview (All Tables Combined)

---

# Minimum System Coverage

✔ Full CRUD operations  
✔ Search & filtering system  
✔ Relational JOIN structure  
✔ Reporting system  
✔ Business logic coverage  
✔ Ready for backend implementation

# Advanced System Enhancements (PRO LEVEL)

---

# 8. Data Integrity & Constraints (Advanced Rules)

➡ Purpose: Protect database consistency

- Ensure unique email for patients and doctors
- Prevent overlapping appointments for same doctor
- Prevent deleting department if doctors exist
- Ensure payment amount is always positive
- Ensure valid enum values for status fields

---

# 9. Soft Delete System (Instead of Hard Delete)

➡ Purpose: Keep history instead of losing data

- Mark Doctor as inactive instead of deleting
- Mark Patient as inactive instead of deleting
- Mark Appointment as cancelled instead of deletion
- Track deleted records using `is_deleted` flag

---

# 10. Audit Logging System

➡ Purpose: Track all changes in the system

- Log every INSERT operation
- Log every UPDATE operation
- Log every DELETE operation
- Store:
  - Table name
  - Action type
  - Timestamp
  - Old value / New value
  - User who performed action

---

# 11. Database Views (Prebuilt Reports)

➡ Purpose: Simplify complex queries

- Doctor Performance View  
  → Shows doctor + patients + revenue

- Patient Medical Summary View  
  → Full medical history in one query

- Appointment Overview View  
  → Appointment + doctor + patient + status

- Revenue Summary View  
  → Monthly + total revenue

---

# 12. Stored Procedures (Reusable Logic)

➡ Purpose: Reusable backend database logic

- Create appointment safely (with validation)
- Calculate doctor revenue automatically
- Generate patient full report
- Cancel appointment with cascade updates

---

# 13. Triggers (Automatic Actions)

➡ Purpose: Auto-run logic on database events

- When appointment is created → log audit entry
- When payment is marked paid → update revenue stats
- When appointment is cancelled → free doctor slot
- When patient is deleted → archive patient data

---

# 14. Scheduling System (Time Control)

➡ Purpose: Prevent conflicts in appointments

- Prevent double booking for same doctor
- Prevent overlapping appointment times
- Validate working hours (e.g., 9AM–5PM only)
- Ensure appointment duration limits

---

# 15. Role-Based Access Control (RBAC)

➡ Purpose: Security layer

- Admin can manage everything
- Doctor can view only:
  - His appointments
  - His patients
- Receptionist can:
  - Create appointments
  - View patients
- Finance role can:
  - Access payments only

---

# 16. Performance Optimization

➡ Purpose: Improve database speed

- Add indexes on:
  - doctor_id
  - patient_id
  - appointment_datetime
- Optimize JOIN queries
- Use pagination for large data sets
- Cache frequent reports (Revenue / Schedule)

---

# 17. Data Archiving System

➡ Purpose: Handle large historical data

- Move old appointments to archive table
- Archive old payments
- Keep only active data in main tables
- Maintain history separately

---

# 18. Advanced Analytics (BI Level)

➡ Purpose: Business intelligence reports

- Most profitable doctor
- Most active department
- Patient visit frequency
- Monthly hospital growth
- Revenue trends over time
- Doctor workload analysis

---
