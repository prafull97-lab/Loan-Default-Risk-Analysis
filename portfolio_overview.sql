-- No. of loans issued --
select count(loanID) as total_loans from loan_default;

-- Overall default rate --
select round(100.0*sum(case when `default` = 1 then 1 else 0 end)/count(*),2) as overall_default_rate from loan_default;

-- Total loan amount --
select sum(loanamount) as total_loan_amount, avg(LoanAmount) as avg_loan_amount from loan_default;

-- Avg borrower income --
select avg(income) as average_borrower_income from loan_default;

-- Avg credit score --
select avg(creditscore) as average_credit_score from loan_default;

-- Avg DTI ratio --
select avg(dtiratio) as average_dti_ratio from loan_default;





			