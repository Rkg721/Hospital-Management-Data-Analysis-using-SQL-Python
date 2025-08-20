# Hospital Management Data Analysis (SQL + Python)

**Author:** Rakesh Kumar Gupta  
**Role:** Data Analyst & MIS Automation  
**Date:** 20 Aug 2025

This repository contains a complete analytics workflow for a Hospital Management System using **SQL** and **Python (Jupyter)**.

## 📦 Project Structure
```
Hospital_Management_Analysis/
├── data/                # Raw datasets (CSV)
├── notebooks/           # Jupyter notebook for EDA & visuals
├── sql/                 # SQL query library (SQLite-compatible)
├── report/              # PDF report
└── README.md
```

## 📊 Datasets
- `appointments.csv`
- `billing.csv`
- `doctors.csv`
- `patients.csv`
- `treatments.csv`

## 🔧 Tech Stack
- SQL (CTEs, window functions, aggregations)
- Python (pandas, matplotlib)
- SQLite-compatible SQL

## ✅ KPIs & Highlights
- **Total Revenue:** ₹509,844+
- **Appointment Failure Rate:** 50.5% (28.5% cancellations, 22.0% no-shows)
- **Top Specialization:** Pediatrics (~45% of revenue)
- **Top Branch:** Eastside (~₹94,874 from completed appointments)
- **Financial Risk:** ~₹3.09L pending/failed bills
- **Avg. Days Registration → First Visit:** ~142 days

## 🧠 Recommendations
1. Automated reminders & rescheduling to reduce cancellations/no-shows
2. Digital payment gateway & collection workflows
3. Expand pediatrics; replicate Eastside best practices
4. Reduce time-to-first-visit from 142 → <30 days

## ▶️ How to Run (Locally)
1. Open `notebooks/hospital_analysis.ipynb`
2. Run all cells. Charts will be generated with matplotlib.
3. Queries are available in `sql/hospital_analysis_queries.sql`.

---

*This repo demonstrates end-to-end analytics: from raw CSVs → KPIs → insights → actions.*