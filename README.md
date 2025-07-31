# 📊 Medicare Spending Data Dashboard

## Overview
This project analyzes Medicare hospital data across the United States to explore the relationship between healthcare costs and hospital quality. It combines two datasets, one containing general hospital information and another with cost metrics, to create an interactive Tableau dashboard for visual exploration.

---

## 🧰 Tools & Technologies
- **SQL** – Data cleaning, joining, preprocessing, and exploration  
- **Tableau** – Dashboard design and interactive visualization  

---

## 📂 Data Sources
- **Hospital General Information Dataset**: Includes hospital names, locations, and quality ratings.
- https://data.cms.gov/provider-data/dataset/xubh-q36u
- **Medicare Spending per Beneficiary Dataset**: Contains average cost data per beneficiary, standardized by state.
- https://data.cms.gov/provider-data/dataset/5hk7-b79m


> 📌 Source: [Centers for Medicare & Medicaid Services (CMS)](https://data.cms.gov)

---

## 🔍 Analysis Workflow
1. **Data Cleaning & Integration (SQL)**
   - Fixed ZIP code formatting by preserving leading zeroes (e.g., “07102”) to ensure proper geographic mapping and accurate joins with location-based datasets.
   - Joined datasets on hospital identifiers

2. **Data Aggregation**
   - Calculated average cost per state
   - Computed average hospital ratings per state
   - Merged and summarized the results

3. **Visualization (Tableau)**
   - Created interactive U.S. maps for average costs and ratings
   - Built bar charts for top/bottom 5 states by cost and rating
   - Included scatterplot to visualize cost vs. quality correlation

---

## 🏥 Dashboard Features

### 🗺️ Page 1: State-Level Overview
- **State-level maps** of average Medicare costs and hospital ratings
- **Top 5 / Bottom 5** bar charts for both cost and quality
- **Correlation scatterplot** between spending and hospital quality

### **🏥** Page 2: Hospital-Level Explorer
- A searchable, filterable list of **2,485 hospitals** with both a **Star Rating** and a **Medicare Cost Value**

#### Included Fields:
- **State**
- **City/Town**
- **Facility Name**
- **Hospital Rating**
- **Average Hospital Cost** (relative to national median)

#### Features:
- Filters for **state**, **city**, **rating**, and **cost**
- Enables targeted exploration of individual hospital performance
- Ideal for benchmarking, patient research, and regional comparisons

> 🖥️ **Interactive Dashboard**

### 🗺️ Page 1: State-Level Overview
<img width="1399" height="798" alt="Medicare Spending Data Dashboard" src="https://github.com/user-attachments/assets/48990d69-5aae-4536-9684-2d5cfd652ca3" />


### **🏥** Page 2: Hospital-Level Explorer
<img width="1396" height="796" alt="Medicare Hospital List" src="https://github.com/user-attachments/assets/4e0f806e-7d9b-4ec1-9b82-c6fcfebd9a0a" />

> 📌 View it live on Tableau Public:
> https://public.tableau.com/views/MedicareHospitalSpending_17492455523140/MedicareSpendingDataDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---

## 🧠 Key Insights
- No strong correlation between higher Medicare spending and hospital quality
- States like **Minnesota**, **Utah**, and **Wisconsin** offer **high-quality care at below-average costs**
- States such as **New Jersey** and **Louisiana** have **above-average costs but lower-rated hospitals**
