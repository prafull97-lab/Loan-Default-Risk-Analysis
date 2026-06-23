-- Income and creditscore analysis --
with cte as 
(select `Default`, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket, 
                    case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
						when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
						when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
						when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
						when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
					end as credit_rating from loan_default)

select Income_Bracket, credit_rating, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by Income_Bracket, credit_rating order by default_rate desc;

-- Income and Employmenttype analysis --
with cte as 
(select `Default`, employmenttype, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very (123001 - 150000)'
					end as Income_Bracket from loan_default)

select Income_Bracket, employmenttype, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by Income_Bracket, employmenttype order by default_rate desc;

-- loanpurpose and employmenttype analysis --
select loanpurpose, employmenttype, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from loan_default group by loanpurpose, EmploymentType order by default_rate desc;


-- loanpurpose and creditscore analysis --
with cte as 
(select `Default`, loanpurpose, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
										when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
										when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
										when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
										when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
									end as credit_rating from loan_default)
                                    
select loanpurpose, credit_rating, round(100.0*SUM(`default`)/count(*),2) as default_rate
from cte group by loanpurpose, credit_rating order by default_rate desc;


-- loanterm and interest rate analysis --
with cte as 
(select `Default`, loanterm, case when InterestRate >= 0 and InterestRate < 5 then 'Very Low'
						when InterestRate >= 5 and InterestRate < 10 then 'Low'
						when InterestRate >= 10 and InterestRate < 15 then 'Medium'
						when InterestRate >= 15 and InterestRate < 20 then 'High'
						when InterestRate >= 20 then 'Very High'
					end as Interest_Rate_band from loan_default)

select loanterm, Interest_Rate_band, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by loanterm, Interest_Rate_band order by default_rate desc;

-- loanpurpose and age analysis --
with cte as
(select `default`, loanpurpose, case when age between 18 and 25 then 'Young Adults(18-25)' 
			when age between 26 and 35 then 'Early Career(26-35)'
            when age between 36 and 45 then 'Mid Career(36-45)'
            when age between 46 and 55 then 'Experienced(46-55)'
            when age >= 56 then 'Senior(56+)'
		end as age_group from loan_default)
        
select age_group, loanpurpose, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by age_group, loanpurpose order by default_rate desc;

-- dtiratio and income analysis --
with cte as 
(select `Default`, case when DTIRatio > 0.5 then 'High Risk (0.5+)'
						when DTIRatio >= 0.43 and DTIRatio <= 0.5 then 'Risky (0.43 - 0.5)'
						when DTIRatio >= 0.37 and DTIRatio <= 0.42 then 'Fair (0.37 - 0.42)'
						when DTIRatio >= 0.3 and DTIRatio <= 0.36 then 'Good (0.3 - 0.36)'
						when DTIRatio < 0.3 then 'Excellent (Less than 0.3)'
					end as dti_band, 
                    case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very High (123001 - 150000)'
					end as Income_Bracket from loan_default)

select dti_band, Income_Bracket, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by dti_band, Income_Bracket order by default_rate desc;

-- hasmortgage and creditscore analysis --
with cte as 
(select `Default`, HasMortgage, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
										when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
										when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
										when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
										when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
									end as credit_rating from loan_default)
                                    
select hasmortgage, credit_rating, round(100.0*SUM(`default`)/count(*),2) as default_rate
from cte group by hasmortgage, credit_rating order by default_rate desc;


-- hasdependents and income analysis --
with cte as 
(select `Default`, HasDependents, case when Income >= 15000 and Income <= 42000 then 'Very Low (15000 - 42000)'
						when Income >= 42001 and Income <=69000 then 'Low (42001 - 69000)'
						when Income >= 69001 and Income <= 96000 then 'Medium (69001 - 96000)'
						when Income >= 96001 and Income <=123000 then 'High (96001 - 123000)'
						when Income >= 123001 and Income <=150000 then 'Very High (123001 - 150000)'
					end as Income_Bracket from loan_default)

select Hasdependents, Income_Bracket, round(100.0*SUM(`default`)/count(*),2) as default_rate 
from cte group by hasdependents, Income_Bracket order by default_rate desc;

-- hascosigner and creditscore analysis --
with cte as 
(select `Default`, Hascosigner, case when CreditScore >=300 and CreditScore <= 579 then 'Poor (300-579)'
										when CreditScore >= 580 and CreditScore <= 669 then 'Fair (580-669)'
										when CreditScore >= 670 and CreditScore <= 739 then 'Good (670-739)'
										when CreditScore >= 740 and CreditScore <= 799 then 'Very Good (740-799)'
										when CreditScore >= 800 and CreditScore <= 850 then 'Exceptional (800-850)'
									end as credit_rating from loan_default)
                                    
select hascosigner, credit_rating, round(100.0*SUM(`default`)/count(*),2) as default_rate
from cte group by hascosigner, credit_rating order by default_rate desc;




                    
