
select count(*) as total_rows from loan_default;

select count(*) from loan_default where loanid is null;
select count(*) from loan_default where age is null;
select count(*) from loan_default where income is null;
select count(*) from loan_default where loanamount is null;
select count(*) from loan_default where creditscore is null;
select count(*) from loan_default where monthsemployed is null;
select count(*) from loan_default where numcreditlines is null;
select count(*) from loan_default where interestrate is null;
select count(*) from loan_default where loanterm is null;
select count(*) from loan_default where dtiratio is null;
select count(*) from loan_default where education is null;
select count(*) from loan_default where employmenttype is null;
select count(*) from loan_default where maritalstatus is null;
select count(*) from loan_default where hasmortgage is null;
select count(*) from loan_default where hasdependents is null;
select count(*) from loan_default where loanpurpose is null;
select count(*) from loan_default where hascosigner is null;
select count(*) from loan_default where `default` is null;

select loanid, count(*) as total from loan_default group by loanid having count(*) > 1;

select min(age), max(age), min(income), max(income), min(loanamount), max(loanamount),
min(creditscore), max(creditscore), min(monthsemployed), max(monthsemployed),
min(numcreditlines), max(numcreditlines), min(interestrate), max(interestrate), 
min(loanterm), max(loanterm), min(dtiratio), max(dtiratio) from loan_default;

select distinct education from loan_default;
select distinct employmenttype from loan_default;
select distinct maritalstatus from loan_default;
select distinct hasmortgage from loan_default;
select distinct hasdependents from loan_default;
select distinct loanpurpose from loan_default;
select distinct hascosigner from loan_default;
select distinct `default` from loan_default;

select count(*) from loan_default where loanid = '';
select count(*) from loan_default where age = '';
select count(*) from loan_default where income = '';
select count(*) from loan_default where loanamount = '';
select count(*) from loan_default where creditscore = '';
select count(*) from loan_default where monthsemployed = '';
select count(*) from loan_default where numcreditlines = '';
select count(*) from loan_default where interestrate = '';
select count(*) from loan_default where loanterm = '';
select count(*) from loan_default where dtiratio = '';
select count(*) from loan_default where education = '';
select count(*) from loan_default where employmenttype = '';
select count(*) from loan_default where maritalstatus = '';
select count(*) from loan_default where hasmortgage = '';
select count(*) from loan_default where hasdependents = '';
select count(*) from loan_default where loanpurpose ='';
select count(*) from loan_default where hascosigner = '';
select count(*) from loan_default where `default` = '';

select count(*) from loan_default where Education <> trim(Education);
select count(*) from loan_default where EmploymentType <> trim(Employmenttype);
select count(*) from loan_default where MaritalStatus <> trim(maritalstatus);
select count(*) from loan_default where HasMortgage <> trim(hasmortgage);
select count(*) from loan_default where HasDependents <> trim(hasdependents);
select count(*) from loan_default where loanpurpose <> trim(loanpurpose);
select count(*) from loan_default where HasCoSigner <> trim(hascosigner);
select count(*) from loan_default where `default` <> trim(`default`);


