## Hospital Management Data Analysis (SQL + Python)

Author: Rakesh Kumar Gupta
Role: Data Analyst & MIS Automation
Date: August 2025

## Project Overview

This project demonstrates a complete end-to-end data analysis workflow for a Hospital Management System using SQL and Python (Jupyter Notebook).

By analyzing 5 structured datasets — Appointments, Patients, Doctors, Treatments, and Billing — I extracted business-critical KPIs, insights, and recommendations to improve operational efficiency and revenue optimization.

 ## Repository Structure
Hospital_Management_Analysis/
├── data/                # Raw datasets (CSV)
│   ├── appointments.csv
│   ├── billing.csv
│   ├── doctors.csv
│   ├── patients.csv
│   └── treatments.csv
│
├── sql/                 # SQL query library
│   └── hospital_analysis_queries.sql
│
├── notebooks/           # Python Jupyter analysis
│   └── hospital_analysis.ipynb
│
├── report/              # Final business analysis report & KPIs
│   ├── Hospital_Management_Data_Analysis_Report.pdf
│   └── kpi_summary.csv
│
└── README.md            # Project documentation

## Tech Stack

SQL → Window functions, CTEs, joins, aggregations

Python (Jupyter Notebook) → Pandas, Matplotlib

Excel/CSV → Data handling & exports

BI Storytelling → Turning raw data → management-ready insights

## Key Business Insights

Total Revenue: ₹5,09,844

Appointment Failure Rate: 50.5% (28.5% cancellations, 22.0% no-shows)

Top Specialization: Pediatrics (₹2,31,180 | 45.3% of total revenue)

Best Performing Branch: Eastside Clinic (₹94,874 from completed appointments)

Financial Risk: ₹3.08 Lakhs (60.5% of bills) pending/failed payments

Patient Experience Gap: Avg. 142 days from registration to first appointment

## Recommendations

Reduce Appointment Failures → Automated SMS/email reminders, online rescheduling, cancellation fee policy

Optimize Cash Flow → Digital payment gateway, collection follow-up team, payment plans for high-cost treatments

Grow High-Revenue Segments → Expand Pediatrics capacity, replicate Eastside best practices across branches

Enhance Patient Experience → Bring down first appointment wait time from 142 days → <30 days

## How to Run the Project

Clone the repository:

git hub -  (https://github.com/Rkg721/Hospital-Management-Data-Analysis-using-SQL-Python)
cd Hospital_Management_Analysis


Open SQL queries in /sql/hospital_analysis_queries.sql using any SQL client (SQLite/Postgres/MySQL).

Run Jupyter Notebook for Python analysis:

jupyter notebook notebooks/hospital_analysis.ipynb


Review KPIs & charts (auto-generated with matplotlib).

## Sample Visuals from Notebook

Revenue by specialization (Bar Chart)

Branch revenue (Completed appointments)

Monthly revenue & appointment trends (Line Chart)

Billing distribution by payment status (Bar Chart)

## Deliverables

📂 SQL Query Library → 12 business-focused queries

📊 Jupyter Notebook → KPI calculations & charts

📑 PDF Report → Final structured business analysis

📈 KPI CSV → Export for dashboard integration

## About the Analyst

I’m Rakesh Kumar Gupta, a Data Analyst specializing in MIS automation, SQL, Python, and BI tools (Power BI, Excel).
I transform raw business data into strategic insights for decision-making and operational excellence.

🔗 Connect with me on LinkedIn - www.linkedin.com/in/rakesh-kr-gupta
