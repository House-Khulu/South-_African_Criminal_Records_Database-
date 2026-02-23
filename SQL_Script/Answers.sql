------------------------------------------------------
----South Africa Criminal Database - 30 SQL Questions 
------------------------------------------------------

SELECT TOP (1000) [RecordID]
      ,[FirstName]
      ,[LastName]
      ,[FullName]
      ,[Age]
      ,[Gender]
      ,[Country]
      ,[Province]
      ,[SouthAfricanID]
      ,[CaseNumber]
      ,[CrimeType]
      ,[FinancialScore]
      ,[EstimatedFraudAmount_ZAR]
      ,[RiskLevel]
      ,[CaseStatus]
      ,[BankInvolved]
      ,[PreviousOffenses]
      ,[Arrested]
      ,[CrimeDate]
      ,[CourtDate]
      ,[InvestigatingOfficer]
      ,[StationCode]
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]

----1. Display all records from the CriminalCases table.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database];

----2. Count the total number of cases in the table.

SELECT COUNT(RecordID) AS Number_of_cases
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database];

----3. Count the number of cases in each province.

SELECT [Province],
COUNT(RecordID) AS Number_of_cases_in_each_province
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [Province];

----4. Retrieve all cases where the crime type is Fraud.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [CrimeType] = 'Fraud';

----5. Count the number of cases for each crime type.

SELECT [CrimeType],
COUNT(*) AS number_of_cases_for_each_crime_type 
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [CrimeType];

----6. Display all cases classified as High or Critical risk.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [RiskLevel] = 'High' OR [RiskLevel] = 'Critical';

----7. Calculate the average Financial Score of all suspects.

SELECT AVG(financialscore) AS Average_financial_score
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database];

----8. Find the highest Estimated Fraud Amount recorded.

SELECT TOP 1 [EstimatedFraudAmount_ZAR]
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
ORDER BY [EstimatedFraudAmount_ZAR] DESC;

----9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.

SELECT TOP 10 * 
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
ORDER BY [EstimatedFraudAmount_ZAR] DESC;

----10. Display all cases where the suspect was arrested.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [Arrested] = 'Yes';

----11. Count how many suspects were arrested versus not arrested.

SELECT COUNT( CaseStatus) AS Arrested
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [Arrested] = 'Yes';

SELECT COUNT( CaseStatus) AS Not_Arrested
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [Arrested] = 'No';

----12. Count the number of cases associated with each bank.

SELECT [BankInvolved],
COUNT(*) AS number_of_cases_associated_with_each_bank 
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [BankInvolved];

----13. Calculate the total Estimated Fraud Amount per province.

SELECT [Province],
SUM(EstimatedFraudAmount_ZAR) AS total_Estimated_Fraud_Amount_per_province
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [Province];

----14. Retrieve all suspects older than 50 years.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [Age] > 50;

----15. Calculate the average age of suspects per province.

SELECT [Province],
AVG(Age) AS Average_age_per_province
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [Province];

----16. Display all cases recorded from 2020 onwards.

SELECT MIN(CrimeDate) AS Minimum__crimedate
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database];

SELECT MAX(CrimeDate) AS Maximum_crimedate
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database];

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [CrimeDate] >= '2020-01-01 00:00:00.0000000';

----17. Count how many cases resulted in a Convicted status.

SELECT COUNT(*) AS No_of_cases_convicted
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [Casestatus] = 'Convicted';

----18. Retrieve all suspects with more than three previous offenses.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [PreviousOffenses] > 3 ;

----19. Show the distribution of cases by Risk Level.

SELECT [RiskLevel], 
COUNT(*) AS total_cases
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [RiskLevel]
ORDER BY total_cases DESC;

----20. Calculate the total Estimated Fraud Amount across all cases.

SELECT SUM(CAST (EstimatedFraudAmount_ZAR AS BIGINT)) AS Total_Estimated_Fraud_Amount
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database];

----21. Identify the province with the highest number of cases.

SELECT TOP 1 [Province],
COUNT(*) AS total_cases_per_Province
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [Province]
ORDER BY total_cases_per_Province DESC;

----22. Retrieve the youngest suspect in the dataset.

SELECT TOP 1 * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
ORDER BY [Age] ASC;

----23. Retrieve the oldest suspect in the dataset.

SELECT TOP 1 * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
ORDER BY [Age] DESC;

----24. Count the number of cases handled by each investigating officer.

SELECT [InvestigatingOfficer],
COUNT(*) AS total_cases_handled_InvestigatingOfficer
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [InvestigatingOfficer]
ORDER BY total_cases_handled_InvestigatingOfficer;

----25. Calculate the average Estimated Fraud Amount per crime type.

SELECT [CrimeType],
AVG(EstimatedFraudAmount_ZAR) AS Average_Estimated_Fraud_Amount_per_crime_type
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [CrimeType];

----26. Display all cases occurring in Gauteng province.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [Province] = 'Gauteng';

----27. Retrieve all Fraud cases classified as High risk.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [RiskLevel] = 'High';

----28. Count the number of cases per year based on CrimeDate.

SELECT 
YEAR(CrimeDate) AS CrimeYear, 
COUNT(*) AS CaseCount
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY YEAR(CrimeDate)
ORDER BY CrimeYear;

----29. Display all suspects with a Financial Score below 500.

SELECT * FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
WHERE [FinancialScore] <500;

----30. Identify the most common Crime Type in the dataset.

SELECT TOP 1 [CrimeType],
COUNT(*) AS most_common_CrimeType
FROM [SA_Criminal_Records_DB].[dbo].[south_africa_criminal_database]
GROUP BY [CrimeType]
ORDER BY most_common_CrimeType DESC;
