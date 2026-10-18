SELECT * FROM us_project.us_household_income_statistics;



SELECT * FROM us_project.ushouseholdincome;


select State_Name, County, City, ALand, AWater
FROM us_project.ushouseholdincome;

select State_Name, SUM(ALand), SUM(AWater)
FROM us_project.ushouseholdincome
group by State_Name
ORDER BY 2 DESC
limit 10;



SELECT * FROM us_project.us_household_income_statistics;



SELECT * 
FROM us_project.ushouseholdincome u
JOIN us_project.us_household_income_statistics us
      ON u.id = us.id;
      
SELECT * 
FROM us_project.ushouseholdincome u
right join us_project.us_household_income_statistics us
      ON u.id = us.id
WHERE u.id is null;