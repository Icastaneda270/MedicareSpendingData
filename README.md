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
> <img width="1399" height="799" alt="Medicare Spending Data Dashboard" src="https://github.com/user-attachments/assets/73f730fc-6639-4095-8e9f-58924ec673d9" />
> <img width="1399" height="799" alt="Medicare Hospital List" src="https://github.com/user-attachments/assets/fba74daa-9d9f-4738-83ff-08b2c246786d" />
> 📌 View it live on Tableau Public:  
> <div class='tableauPlaceholder' id='viz1753929798150' style='position: relative'><noscript><a href='#'><img alt='Medicare Spending Data Dashboard ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Me&#47;MedicareHospitalSpending_17492455523140&#47;MedicareSpendingDataDashboard&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='path' value='views&#47;MedicareHospitalSpending_17492455523140&#47;MedicareSpendingDataDashboard?:language=en-US&amp;:embed=true&amp;:sid=&amp;:redirect=auth' /> <param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Me&#47;MedicareHospitalSpending_17492455523140&#47;MedicareSpendingDataDashboard&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1753929798150');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1400px';vizElement.style.height='827px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1400px';vizElement.style.height='827px';} else { vizElement.style.width='100%';vizElement.style.height='3777px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>


---

## 🧠 Key Insights
- No strong correlation between higher Medicare spending and hospital quality
- States like **Minnesota**, **Utah**, and **Wisconsin** offer **high-quality care at below-average costs**
- States such as **New Jersey** and **Louisiana** have **above-average costs but lower-rated hospitals**
