- Query 1: Total Employees
SELECT COUNT(*) AS total_employees
FROM WA_FnUseC_HREmployeeAttrition;

- Query 2: How many left the company
SELECT COUNT(*) AS left_company
FROM WA_FnUseC_HREmployeeAttrition
WHERE Attrition = 'Yes';

- Query 3: Attrition Rate
SELECT COUNT(*) AS total,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_rate_pct
FROM WA_FnUseC_HREmployeeAttrition;

- Query 4: Department wise attrition
SELECT Department,
COUNT(*) AS total,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM WA_FnUseC_HREmployeeAttrition
GROUP BY Department
ORDER BY attrition_pct DESC;

- Query 5: OverTime vs Attrition
SELECT OverTime,
COUNT(*) AS total,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM WA_FnUseC_HREmployeeAttrition
GROUP BY OverTime;

- Query 6: Gender wise attrition
SELECT Gender,
COUNT(*) AS total,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM WA_FnUseC_HREmployeeAttrition
GROUP BY Gender;

- Query 7: Job Satisfaction vs Attrition
SELECT JobSatisfaction,
COUNT(*) AS total,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM WA_FnUseC_HREmployeeAttrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

- Query 8: Salary Bracket vs Attrition
SELECT
CASE
  WHEN MonthlyIncome < 3000 THEN 'Low'
  WHEN MonthlyIncome < 7000 THEN 'Mid'
  WHEN MonthlyIncome < 12000 THEN 'High'
  ELSE 'Very High'
END AS salary_bracket,
COUNT(*) AS total,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM WA_FnUseC_HREmployeeAttrition
GROUP BY salary_bracket;

- Query 9: Top performers who left
SELECT Department, JobRole, MonthlyIncome, JobSatisfaction
FROM WA_FnUseC_HREmployeeAttrition
WHERE Attrition = 'Yes'
AND JobSatisfaction = 1
ORDER BY MonthlyIncome DESC;

- Query 10: Departments where attrition is more than 15%
SELECT Department,
COUNT(*) AS total,
ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS attrition_pct
FROM WA_FnUseC_HREmployeeAttrition
GROUP BY Department
HAVING attrition_pct > 15;
