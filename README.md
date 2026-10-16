# Netflix_Analysis_SQL

This project transforms raw, unnormalized Netflix dataset (flat CSV file) into a structured relational schema with multiple tables to perform deep-dive SQL analytics. By modeling the data properly and leveraging advanced SQL techniques, this analysis extracts actionable business insights regarding Netflix's content offerings, release trends, genres, cast/crew contributions, and geographic availability.


📂 Data Normalization & Database Schema
The original raw dataset consisted of a single flat CSV file containing multi-value attributes (such as comma-separated lists for directors, cast, countries, and genres).
To ensure optimal querying efficiency and data integrity:
Raw CSV Ingestion: Loaded into a staging table.
Schema Redesign: Decomposed the flat structure into normalized normalized/relational tables (e.g., titles, directors, cast, genres, countries, and junction/mapping tables).
Data Cleaning & Parsing: Employed string splitting, trimming, and NULL handling to populate primary and foreign key relationships.


🛠️ Key SQL Techniques Used
Data Normalization & Cleaning: String parsing, splitting comma-separated strings (STRING_SPLIT, UNNEST, or SUBSTRING_INDEX), and handling missing data.
Aggregations & Grouping: COUNT, AVG, SUM, GROUP BY, HAVING for summary stats.
Common Table Expressions (CTEs): Modularizing multi-step analytical queries for better readability and efficiency.
Window Functions: ROW_NUMBER(), RANK(), DENSE_RANK(), LAG(), and LEAD() for trend analysis and ranking content performance.
String Manipulation: TRIM(), LOWER(), UPPER(), CONCAT(), and pattern matching (LIKE, REGEX).


🔍 Key Business Questions Addressed
Content Distribution: What is the breakdown between Movies vs. TV Shows over time?
Top Contributors: Who are the most frequent directors and actors in Netflix's catalog?
Geographic Insights: Which countries produce the most content, and how do genres vary by region?
Release Trends: How has content addition accelerated by year and month?
Genre Analysis: What are the most popular content categories across different content types?
