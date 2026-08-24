# U.S. Data Job Market Analysis 2026

## Project Overview

This project analyzes the 2026 U.S. job market for three major data career paths:

- Data Analyst
- Data Engineer
- Data Scientist

The goal of the project is to understand how these roles differ in terms of job opportunities, salaries, and technical skill requirements.

The project follows an end-to-end data analysis workflow, from collecting job postings through an API to cleaning, exploratory data analysis, statistical testing, and dashboard development.

---

## Research Questions

This project focuses on the following questions:

1. What technical skills are most in demand for data-related jobs?
2. How does technical skill demand differ between Data Analysts, Data Engineers, and Data Scientists?
3. Are salaries significantly different across the three data roles?
4. Which data roles offer the highest salaries?
5. Is there a statistical association between data role and technical skill demand?

---

## Data Source

Job posting data was collected from the Adzuna Jobs API in 2026.

The analysis focuses on U.S. job postings for:

- Data Analyst
- Data Engineer
- Data Scientist

After data preparation and cleaning, the final dataset contained **5,941 job postings**.

---

## Tools & Technologies

### R
Used for:
- API data collection
- Building the dataset
- Data cleaning
- Exploratory Data Analysis (EDA)
- Data visualization

### Python
Used for:
- Statistical analysis
- Hypothesis testing
- Chi-square tests
- Cramér's V
- Kruskal-Wallis tests
- Pairwise comparisons

### Power BI
Used to build an interactive three-page dashboard covering:

1. U.S. Data Job Market Overview
2. Salary Analysis
3. Skills Analysis

---

## Project Workflow

The project followed this workflow:

**Adzuna API → Data Collection → Dataset Creation → Data Cleaning → EDA → Statistical Analysis → Power BI Dashboard → Conclusions**

---

## Exploratory Data Analysis

EDA was performed in R to understand salary distributions, differences between data roles, and technical skill demand.

The analysis included:

- Salary distribution
- Salary comparison by role
- Technical skill frequency
- Technical skills by data role
- Identification of salary outliers

The salary distribution was right-skewed, with several high-salary job postings.

---

## Salary Analysis

The overall median salary was approximately **$125.76K**, while the average salary was approximately **$135.1K**.

Median salaries differed substantially across roles:

| Data Role | Median Salary |
|---|---:|
| Data Scientist | ~$147K |
| Data Engineer | ~$138K |
| Data Analyst | ~$99K |

Data Scientist positions had the highest median salary, followed by Data Engineer and Data Analyst positions.

Statistical testing was used to determine whether these differences were statistically significant.

---

## Technical Skills Analysis

SQL and Python were the two most frequently identified technical skills in the available job-description excerpts.

Top skills included:

| Skill | Job Postings |
|---|---:|
| SQL | 311 |
| Python | 265 |
| AWS | 117 |
| Snowflake | 105 |
| Databricks | 99 |
| Azure | 90 |
| Spark | 62 |
| Power BI | 62 |
| Tableau | 43 |
| Excel | 30 |

Skill demand also varied considerably by role.

Data Engineer postings showed particularly strong demand for Python, SQL, AWS, Snowflake, Databricks, Azure, and Spark.

Power BI and Tableau appeared more prominently among Data Analyst postings.

---

## Statistical Analysis

Statistical analysis was conducted in Python.

### Salary Differences

Because salary distributions were not normally distributed, a **Kruskal-Wallis test** was used to compare salary distributions across the three roles.

The analysis found statistically significant salary differences between the roles.

Pairwise Mann-Whitney tests were then used to investigate differences between individual role pairs.

### Skill Demand

Chi-square tests were used to determine whether individual technical skills were associated with data role.

Several skills showed statistically significant associations with role, including:

- Python
- SQL
- AWS
- Azure
- Databricks
- Spark
- Snowflake
- Power BI
- Tableau

Cramér's V was used to measure the strength of these relationships.

Although several associations were statistically significant, the effect sizes were generally weak, indicating that many technical skills are shared across data roles.

---

## Power BI Dashboard

The final Power BI dashboard contains three interactive pages.

### 1. U.S. Data Job Market Overview

Provides an overview of:

- Total job postings
- Median salary
- Average salary
- Maximum salary
- Job postings by role
- Median salary by role
- Top job categories

### 2. Salary Analysis

Focuses on:

- Median salary
- Average salary
- Minimum salary
- Maximum salary
- Salary distribution by role
- Salary ranges across roles

### 3. Skills Analysis

Explores:

- Top technical skills
- Top skills by role
- Skill demand across roles
- Technical skill frequencies
- Statistical findings


## Key Findings

The analysis produced several important findings:

- Data Scientist positions had the highest median salary.
- Data Engineer positions also showed strong salary levels.
- Data Analyst positions had the lowest median salary among the three roles.
- SQL and Python were the most frequently identified technical skills.
- Cloud and data-platform technologies were especially prominent in Data Engineer postings.
- Technical skill demand varies statistically across data roles.
- Despite statistically significant differences, Cramér's V values suggest that most relationships between individual skills and roles are relatively weak.


## Repository Structure

```text
US-Data-Job-Market-Analysis-2026/
│
├── R/
│   ├── 01_api_connection.R
│   ├── 02_data_collection.R
│   ├── 03_build_dataset.R
│   ├── 04_data_cleaning.R
│   └── 05_eda.R
│
├── Python/
│   └── statistical_analysis.ipynb
│
├── data/
│   └── jobs_data_cleaned_2026.csv
│
├── PowerBI/
│   └── Dashboard screenshots
│
└── README.md


## Conclusion

This project demonstrates how R, Python, statistical analysis, and Power BI can be combined in an end-to-end data analytics workflow.

The results show that Data Analyst, Data Engineer, and Data Scientist positions share many core technical skills but differ in salary levels and the relative demand for specific technologies.

Overall, the project provides a data-driven view of the skills and salary patterns associated with major data careers in the U.S. job market in 2026.


## Author

**Enock Kanyinda**

Data Science & Analytics
