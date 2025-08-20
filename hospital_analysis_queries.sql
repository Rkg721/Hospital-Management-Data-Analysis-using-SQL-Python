-- Hospital Management Data Analysis - SQL Query Library
-- Author: Rakesh Kumar Gupta
-- Date: 2025-08-20
-- DB: SQLite syntax (works with most SQL engines with minor tweaks)

/* Query 1: Revenue Analysis by Doctor Specialization */
SELECT d.specialization, SUM(b.amount) AS total_revenue
FROM billing b
INNER JOIN treatments t ON b.treatment_id = t.treatment_id
INNER JOIN appointments a ON t.appointment_id = a.appointment_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.specialization
ORDER BY total_revenue DESC;

/* Query 2: Top Revenue-Generating Patients (Top 5) */
SELECT p.first_name, p.last_name, SUM(b.amount) AS total_bill_amount
FROM billing b
INNER JOIN patients p ON b.patient_id = p.patient_id
GROUP BY p.first_name, p.last_name
ORDER BY total_bill_amount DESC
LIMIT 5;

/* Query 3: Appointment Failure Rates (Cancellation & No-show) */
SELECT 
  CAST(SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS cancellation_rate_pct,
  CAST(SUM(CASE WHEN status = 'No-show' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS no_show_rate_pct,
  CAST(SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS completed_rate_pct
FROM appointments;

/* Query 4: Hospital Branch Performance (Completed Appointments Only) */
SELECT d.hospital_branch, SUM(b.amount) AS total_revenue_completed_appts
FROM billing b
INNER JOIN treatments t ON b.treatment_id = t.treatment_id
INNER JOIN appointments a ON t.appointment_id = a.appointment_id
INNER JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.hospital_branch
ORDER BY total_revenue_completed_appts DESC;

/* Query 5: Treatment Cost Analysis (Average Cost by Treatment Type) */
SELECT treatment_type, AVG(cost) AS average_cost
FROM treatments
GROUP BY treatment_type
ORDER BY average_cost DESC;

/* Query 6: Monthly Revenue & Appointment Trends */
SELECT STRFTIME('%Y-%m', a.appointment_date) AS month,
       COUNT(DISTINCT a.appointment_id) AS total_appointments,
       SUM(b.amount) AS total_revenue
FROM appointments a
INNER JOIN billing b ON a.patient_id = b.patient_id
GROUP BY month
ORDER BY month;

/* Query 7: Advanced Patient Behavior (Most Frequent Reason per Patient; filter Consultation) */
WITH patient_visit_rank AS (
    SELECT patient_id,
           reason_for_visit,
           COUNT(*) AS visit_count,
           RANK() OVER (PARTITION BY patient_id ORDER BY COUNT(*) DESC) AS rnk
    FROM appointments
    GROUP BY patient_id, reason_for_visit
)
SELECT p.first_name, p.last_name
FROM patient_visit_rank pvr
INNER JOIN patients p ON pvr.patient_id = p.patient_id
WHERE pvr.rnk = 1 AND pvr.reason_for_visit = 'Consultation';

/* Query 8: Doctor Performance Benchmarking (Above-average appointment volume) */
SELECT d.first_name, d.last_name, COUNT(a.appointment_id) AS num_appointments
FROM doctors d
INNER JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.first_name, d.last_name
HAVING COUNT(a.appointment_id) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT COUNT(appointment_id) AS appointment_count
        FROM appointments
        GROUP BY doctor_id
    ) AS avg_counts
)
ORDER BY num_appointments DESC;

/* Query 9: Insurance Provider Cost Attribution */
SELECT p.insurance_provider, SUM(t.cost) AS total_cost
FROM treatments t
INNER JOIN appointments a ON t.appointment_id = a.appointment_id
INNER JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.insurance_provider
ORDER BY total_cost DESC;

/* Query 10: Patient Onboarding Efficiency (Days to First Appointment by Gender) */
SELECT p.gender, AVG(JULIANDAY(a.appointment_date) - JULIANDAY(p.registration_date)) AS avg_days_to_first_appointment
FROM appointments a
INNER JOIN patients p ON a.patient_id = p.patient_id
WHERE a.status = 'Completed' 
  AND a.appointment_date = (
      SELECT MIN(appointment_date) 
      FROM appointments 
      WHERE patient_id = a.patient_id
  )
GROUP BY p.gender;

/* Bonus Query 11: Outstanding vs Paid Amounts */
SELECT payment_status,
       COUNT(*) AS bills,
       SUM(amount) AS total_amount
FROM billing
GROUP BY payment_status;

/* Bonus Query 12: Revenue at Risk from Appointment Failures (join) */
SELECT a.status, SUM(b.amount) AS billed_amount
FROM appointments a
LEFT JOIN treatments t ON a.appointment_id = t.appointment_id
LEFT JOIN billing b ON t.treatment_id = b.treatment_id
GROUP BY a.status
ORDER BY billed_amount DESC;