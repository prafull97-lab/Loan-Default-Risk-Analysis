-- employmenttype, income and creditscore analysis --
with cte1 as
(select `default`, employmenttype, case when age between 18 and 25 then 'Young Adults(18-25)' 
			when age between 26 and 35 then 'Early Career(26-35)'
            when age between 36 and 45 then 'Mid Career(36-45)'
            when age between 46 and 55 then 'Experienced(46-55)'
            when age >= 56 then 'Senior(56+)'
		end as age_group, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
										when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
										when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
										when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
										when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
									end as credit_rating from loan_default
)
        
select age_group, Income_Bracket, credit_rating, employmenttype, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte1 group by age_group, Income_Bracket, credit_rating, employmenttype order by default_rate asc limit 1;

-- loanpurpose, loanterm and loanamount analysis --
with cte as
(select `default`, loanpurpose, loanterm, case when LoanAmount between 5000 and 9999 then '5000-9999' 
			when LoanAmount between 10000 and 24999 then '10000-24999'
            when LoanAmount between 25000 and 49999 then '25000-49999'
            when LoanAmount between 50000 and 99999 then '50000-99999'
            when LoanAmount between 100000 and 249999 then '100000-249999'
		end as loan_amounts, case when InterestRate >= 0 and InterestRate < 5 then 'Very Low'
						when InterestRate >= 5 and InterestRate < 10 then 'Low'
						when InterestRate >= 10 and InterestRate < 15 then 'Medium'
						when InterestRate >= 15 and InterestRate < 20 then 'High'
						when InterestRate >= 20 then 'Very High'
					end as Interest_Rate_band from loan_default)
        
select loan_amounts, interest_rate_band, loanterm, loanpurpose, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by loan_amounts, interest_rate_band, loanterm, loanpurpose order by default_rate desc limit 1;

-- income, creditscore and dtiratio analysis --
with cte1 as
(select `default`, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
										when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
										when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
										when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
										when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
									end as credit_rating, case when DTIRatio > 0.5 then 'High Risk (0.5+)'
																when DTIRatio >= 0.43 and DTIRatio <= 0.5 then 'Risky (0.43 - 0.5)'
																when DTIRatio >= 0.37 and DTIRatio <= 0.42 then 'Fair (0.37 - 0.42)'
																when DTIRatio >= 0.3 and DTIRatio <= 0.36 then 'Good (0.3 - 0.36)'
																when DTIRatio < 0.3 then 'Excellent (Less than 0.3)'
															end as dti_band from loan_default
)
        
select Income_Bracket, credit_rating, dti_band, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte1 group by Income_Bracket, credit_rating, dti_band order by default_rate desc limit 1;


-- loanpurpose, employmenttype and creditscore analysis --
with cte as
(select `default`, loanpurpose, employmenttype, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
										when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
										when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
										when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
										when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
									end as credit_rating from loan_default)
        
select loanpurpose, employmenttype, credit_rating, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by loanpurpose, employmenttype, credit_rating order by default_rate desc limit 1;

-- loanamount, employmenttype and age, income and interestrate analysis --
with cte1 as
(select `default`, loanamount, employmenttype, case when age between 18 and 25 then 'Young Adults(18-25)' 
			when age between 26 and 35 then 'Early Career(26-35)'
            when age between 36 and 45 then 'Mid Career(36-45)'
            when age between 46 and 55 then 'Experienced(46-55)'
            when age >= 56 then 'Senior(56+)'
		end as age_group, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket, case when InterestRate >= 0 and InterestRate < 5 then 'Very Low'
						when InterestRate >= 5 and InterestRate < 10 then 'Low'
						when InterestRate >= 10 and InterestRate < 15 then 'Medium'
						when InterestRate >= 15 and InterestRate < 20 then 'High'
						when InterestRate >= 20 then 'Very High'
					end as Interest_Rate_band from loan_default
)
        
select age_group, Income_Bracket, interest_rate_band, employmenttype, SUM(case when `Default` = 1 then 1 else 0 end) as total_defaults,
SUM(case when `Default` = 1 then loanamount end) as total_defaulted_amount
from cte1 group by age_group, Income_Bracket, interest_rate_band, employmenttype order by total_defaults desc limit 1;

-- Avg of different values of defaulters --
select avg(age), avg(income), avg(loanamount), avg(creditscore), avg(monthsemployed), avg(numcreditlines), avg(interestrate),
avg(loanterm), avg(dtiratio) from loan_default where `default` = 1;




-- Age groups with defaults --
with cte as
(select `default`, case when age between 18 and 25 then 'Young Adults(18-25)' 
			when age between 26 and 35 then 'Early Career(26-35)'
            when age between 36 and 45 then 'Mid Career(36-45)'
            when age between 46 and 55 then 'Experienced(46-55)'
            when age >= 56 then 'Senior(56+)'
		end as age_group from loan_default)
        
select age_group, SUM(`default`) as total_defaults
from cte group by age_group order by total_defaults desc limit 1;

-- Education level default rate --
select education, SUM(`default`) as total_defaults
from loan_default group by education order by total_defaults desc limit 1;

-- Marital Status default rate --
select maritalstatus, SUM(`default`) as total_defaults
from loan_default group by maritalstatus order by total_defaults desc limit 1;

-- Employment Type default rate --
select employmenttype, SUM(`default`) as total_defaults
from loan_default group by EmploymentType order by total_defaults desc limit 1;

-- Employment Duration default rate --
with cte as
(select `default`, case when MonthsEmployed between 0 and 59 then '0-59' 
			when MonthsEmployed between 60 and 69 then '60-69'
            when MonthsEmployed between 70 and 79 then '70-79'
            when MonthsEmployed between 80 and 89 then '80-89'
            when MonthsEmployed between 90 and 119 then '90-119'
		end as employment_duration_months from loan_default)
        
select employment_duration_months, SUM(`default`) as total_defaults 
from cte group by employment_duration_months order by total_defaults desc limit 1;

-- Income Group default rate --
with cte as 
(select `Default`, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket from loan_default)

select Income_Bracket, SUM(`default`) as total_defaults
from cte group by Income_Bracket order by total_defaults desc limit 1;

-- Credit Score default rate --
with cte as 
(select `Default`, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
						when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
						when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
						when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
						when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
					end as credit_rating from loan_default)

select credit_rating, SUM(`default`) as total_defaults
from cte group by credit_rating order by total_defaults desc limit 1;

-- DTI Ratio default rate -- 
with cte as 
(select `Default`, case when DTIRatio > 0.5 then 'High Risk (0.5+)'
						when DTIRatio >= 0.43 and DTIRatio <= 0.5 then 'Risky (0.43 - 0.5)'
						when DTIRatio >= 0.37 and DTIRatio <= 0.42 then 'Fair (0.37 - 0.42)'
						when DTIRatio >= 0.3 and DTIRatio <= 0.36 then 'Good (0.3 - 0.36)'
						when DTIRatio < 0.3 then 'Excellent (Less than 0.3)'
					end as dti_band from loan_default)

select dti_band, SUM(`default`) as total_defaults
from cte group by dti_band order by total_defaults desc limit 1;

-- Loan Purpose Default Rate --
select loanpurpose, SUM(`default`) as total_defaults
from loan_default group by loanpurpose order by total_defaults desc limit 1;

-- Loan Term Default Rate -- 
select loanterm, SUM(`default`) as total_defaults
from loan_default group by loanterm order by total_defaults desc limit 1;

-- Interest Rate bands default rate --
with cte as 
(select `Default`, case when InterestRate >= 0 and InterestRate < 5 then 'Very Low'
						when InterestRate >= 5 and InterestRate < 10 then 'Low'
						when InterestRate >= 10 and InterestRate < 15 then 'Medium'
						when InterestRate >= 15 and InterestRate < 20 then 'High'
						when InterestRate >= 20 then 'Very High'
					end as Interest_Rate_band from loan_default)

select Interest_Rate_band, SUM(`default`) as total_defaults
from cte group by Interest_Rate_band order by total_defaults desc limit 1;

-- Loan Amount Default Rate --
with cte as
(select `default`, case when LoanAmount between 5000 and 9999 then '5000-9999' 
			when LoanAmount between 10000 and 24999 then '10000-24999'
            when LoanAmount between 25000 and 49999 then '25000-49999'
            when LoanAmount between 50000 and 99999 then '50000-99999'
            when LoanAmount between 100000 and 249999 then '100000-249999'
		end as loan_amounts from loan_default)
        
select loan_amounts, SUM(`default`) as total_defaults
from cte group by loan_amounts order by total_defaults desc limit 1;

-- Mortgage Default Rate --
select hasmortgage, SUM(`default`) as total_defaults
from loan_default group by hasmortgage order by total_defaults desc limit 1;

-- Dependents Default Rate --
select hasdependents, SUM(`default`) as total_defaults
from loan_default group by hasdependents order by total_defaults desc limit 1;

-- CoSigner Default Rate -- 
select hascosigner, SUM(`default`) as total_defaults
from loan_default group by hascosigner order by total_defaults desc limit 1;

-- Credit Lines Default Rate --
select NumCreditLines, SUM(`default`) as total_defaults
from loan_default group by NumCreditLines order by total_defaults desc ;



-- Average of different values of non-defaulters --
select avg(age), avg(income), avg(loanamount), avg(creditscore), avg(monthsemployed), avg(numcreditlines), avg(interestrate),
avg(loanterm), avg(dtiratio) from loan_default where `default` = 0;




-- Age groups with defaults --
with cte as
(select `default`, case when age between 18 and 25 then 'Young Adults(18-25)' 
			when age between 26 and 35 then 'Early Career(26-35)'
            when age between 36 and 45 then 'Mid Career(36-45)'
            when age between 46 and 55 then 'Experienced(46-55)'
            when age >= 56 then 'Senior(56+)'
		end as age_group from loan_default)
        
select age_group, SUM(case when `default` = 0 then 1 else 0 end) as total_non_defaults
from cte group by age_group order by total_non_defaults desc limit 1;

-- Education level default rate --
select education, SUM(case when `default` = 0 then 1 else 0 end) as total_non_defaults
from loan_default group by education order by total_non_defaults desc ;

-- Marital Status default rate --
select maritalstatus, SUM(case when `default` = 0 then 1 else 0 end) as total_non_defaults
from loan_default group by maritalstatus order by total_non_defaults desc limit 1;

-- Employment Type default rate --
select employmenttype, SUM(case when `default` = 0 then 1 else 0 end) as total_non_defaults
from loan_default group by EmploymentType order by total_non_defaults desc limit 1;

-- Employment Duration default rate --
with cte as
(select `default`, case when MonthsEmployed between 0 and 59 then '0-59' 
			when MonthsEmployed between 60 and 69 then '60-69'
            when MonthsEmployed between 70 and 79 then '70-79'
            when MonthsEmployed between 80 and 89 then '80-89'
            when MonthsEmployed between 90 and 119 then '90-119'
		end as employment_duration_months from loan_default)
        
select employment_duration_months, SUM(case when `default` = 0 then 1 else 0 end) as total_non_defaults 
from cte group by employment_duration_months order by total_non_defaults desc limit 1;

-- Income Group default rate --
with cte as 
(select `Default`, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket from loan_default)

select Income_Bracket, SUM(case when `default` = 0 then 1 else 0 end) as total_non_defaults
from cte group by Income_Bracket order by total_non_defaults desc limit 1;

-- Credit Score default rate --
with cte as 
(select `Default`, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
						when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
						when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
						when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
						when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
					end as credit_rating from loan_default)

select credit_rating, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from cte group by credit_rating order by total_defaults desc limit 1;

-- DTI Ratio default rate -- 
with cte as 
(select `Default`, case when DTIRatio > 0.5 then 'High Risk (0.5+)'
						when DTIRatio >= 0.43 and DTIRatio <= 0.5 then 'Risky (0.43 - 0.5)'
						when DTIRatio >= 0.37 and DTIRatio <= 0.42 then 'Fair (0.37 - 0.42)'
						when DTIRatio >= 0.3 and DTIRatio <= 0.36 then 'Good (0.3 - 0.36)'
						when DTIRatio < 0.3 then 'Excellent (Less than 0.3)'
					end as dti_band from loan_default)

select dti_band, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from cte group by dti_band order by total_defaults desc limit 1;

-- Loan Purpose Default Rate --
select loanpurpose, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from loan_default group by loanpurpose order by total_defaults desc limit 1;

-- Loan Term Default Rate -- 
select loanterm, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from loan_default group by loanterm order by total_defaults desc limit 1;

-- Interest Rate bands default rate --
with cte as 
(select `Default`, case when InterestRate >= 0 and InterestRate < 5 then 'Very Low'
						when InterestRate >= 5 and InterestRate < 10 then 'Low'
						when InterestRate >= 10 and InterestRate < 15 then 'Medium'
						when InterestRate >= 15 and InterestRate < 20 then 'High'
						when InterestRate >= 20 then 'Very High'
					end as Interest_Rate_band from loan_default)

select Interest_Rate_band, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from cte group by Interest_Rate_band order by total_defaults desc limit 1;

-- Loan Amount Default Rate --
with cte as
(select `default`, case when LoanAmount between 5000 and 9999 then '5000-9999' 
			when LoanAmount between 10000 and 24999 then '10000-24999'
            when LoanAmount between 25000 and 49999 then '25000-49999'
            when LoanAmount between 50000 and 99999 then '50000-99999'
            when LoanAmount between 100000 and 249999 then '100000-249999'
		end as loan_amounts from loan_default)
        
select loan_amounts, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from cte group by loan_amounts order by total_defaults desc limit 1;

-- Mortgage Default Rate --
select hasmortgage, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from loan_default group by hasmortgage order by total_defaults desc limit 1;

-- Dependents Default Rate --
select hasdependents, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from loan_default group by hasdependents order by total_defaults desc limit 1;

-- CoSigner Default Rate -- 
select hascosigner, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from loan_default group by hascosigner order by total_defaults desc limit 1;

-- Credit Lines Default Rate --
select NumCreditLines, SUM(case when `default` = 0 then 1 else 0 end) as total_defaults
from loan_default group by NumCreditLines order by total_defaults desc limit 1;
