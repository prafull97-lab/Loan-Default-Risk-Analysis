Loan Default Risk Analysis | SQL + Power BI

Project Overview:
This project analyzes a portfolio of 255,347 bank loans to identify the key drivers of loan default. The analysis follows a structured end-to-end data analytics workflow — from data profiling and cleaning through to SQL analysis and an interactive Power BI dashboard.

The core business question driving this project is:
"What factors drive loan defaults, and which borrower profiles are highest risk?"

Tools Used:
MySQL — Data profiling, cleaning and analysis
Power BI — Interactive dashboard and data visualization
Microsoft Excel — Initial data exploration

Dataset:
Source: Kaggle — Loan Default Dataset
Size: 255,347 rows, 18 columns
Key Fields: Borrower demographics, financial profile, loan characteristics and default status

Project Workflow:

Phase 1 — Data Profiling & Cleaning
Before any analysis, a full data profiling exercise was conducted including:
Row and column count verification
Data type validation
NULL value checks across all 18 columns
Duplicate record detection
Distinct value checks on all categorical columns
Min/Max validation on all numeric columns
Blank string and leading/trailing space checks

Result: Dataset was found to be clean with no nulls, duplicates or inconsistencies. No cleaning was required.

Phase 2 — Descriptive Analysis (7 Questions)
Established baseline portfolio metrics including total loans issued, overall default rate, total loan exposure and average borrower financial profile.

Key Finding:
The portfolio carries an 11.61% default rate with an average credit score of 574 — below the industry threshold of 670 — indicating a subprime borrower base with a high average DTI ratio of 0.50.

Phase 3 — Univariate Analysis (16 Questions)
Analyzed each variable independently against default rate to identify the strongest individual risk factors.

Key Findings:
Age is the strongest demographic signal — Young Adults (18-25) default at 20.76% versus Seniors at 5.50%
Interest Rate is the strongest loan signal — Very High rate borrowers default at 17.82% versus Very Low at 6.02%
Income Level shows nearly 2x difference — Very Low income borrowers default at 18.55% versus Very High at 8.97%
Employment stability matters — Borrowers with less than 5 years tenure default at 14.28% versus veterans at 7.86%

Phase 4 — Bivariate Analysis (10 Questions)
Analyzed pairs of variables together to find interaction effects and combined risk patterns.

Key Findings:
Income dominates credit score — Very Low income borrowers default at 15-19% regardless of credit score band
Age dominates loan purpose — Young Adults default at over 18% across every loan purpose
A co-signer effectively upgrades a borrower's risk profile by one full credit band
Interest rate dominates loan term — term length adds almost no risk signal once interest rate is accounted for

Phase 5 — Multivariate Analysis (8 Questions)
Combined three or more variables to identify the highest and lowest risk borrower and loan profiles.

Key Findings:
Highest risk profile: Young Adults, Very Low Income, Fair Credit, Unemployed → 38.22% default rate
Lowest risk profile: Seniors, Very High Income, Very Good Credit, Self-employed → 1.60% default rate
Most financially damaging segment: Early Career, Very Low Income, Very High Interest Rate, Unemployed → 233 defaults totaling $35.3 million
Riskiest loan combination: Business loans, Unemployed borrowers, Poor Credit → 15.72% default rate

Phase 6 — Executive Insights

Top 5 Drivers of Default:
Age — Young borrowers default at nearly 4x the rate of seniors
Interest Rate — Very High rate borrowers default at 3x the rate of Very Low rate borrowers
Income Level — Very Low income borrowers default at 2x the rate of Very High income borrowers
Employment Status — Unemployed borrowers consistently appear in every high risk combination
Loan Amount — Larger loans default significantly more than smaller loans

High Risk Borrower Profile:
Young Adult, Divorced, High School educated, Unemployed, Very Low Income, Poor Credit Score, no mortgage, no dependents, no co-signer, Business loan at Very High interest rate

Low Risk Borrower Profile:
Senior, Married, PhD educated, Full-time employed, Very High Income, Good Credit Score, has mortgage, has dependents, backed by co-signer, Home loan at Low interest rate

Power BI Dashboard
The interactive dashboard is organized across three pages:
Executive Summary: Overall KPIs, default split, top level risk signals
Borrower Risk Analysis: Age, Income, Employment, Credit Score, Borrower Profiles
Loan Risk Analysis: Interest Rate, Loan Amount, Loan Purpose, Riskiest Combinations

Key Recommendations:
Apply stricter approval criteria for borrowers under 25 with income below $42,000
Flag all Business loan applications from Unemployed borrowers for enhanced review
Require co-signers for any borrower with Very High interest rate assignment and Poor credit score
Monitor borrowers with 4 or more existing credit lines as a leading default indicator
Offer preferential pricing to Senior borrowers with Full-time employment and existing mortgage

About This Project
This project was built as part of my data analytics portfolio to demonstrate end-to-end analytical skills including data profiling, SQL analysis and Power BI dashboard development. The methodology follows real world credit risk analysis practices used in banking and financial services.