SELECT * FROM world_life_expectancy;

SELECT *
 FROM world_life_expectancy;
 
 SELECT Country, Year, concat(country,Year), count(concat(country,Year))
 FROM world_life_expectancy
 group by Country, Year, concat(country,Year)
 having count(concat(country,Year)) > 1;
 
 
 
 select *
 from(
  select row_id,
  concat(country, Year),
  row_number() over( partition by concat(country,Year) order by concat(country,Year)) as row_num
  FROM world_life_expectancy
  ) as row_table
 where row_num > 1;
 
 
 
 delete from world_life_expectancy
 where
    row_id in (
    select row_id
 from(
  select row_id,
  concat(country, Year),
  row_number() over( partition by concat(country,Year) order by concat(country,Year)) as row_num
  FROM world_life_expectancy
  ) as row_table
 where row_num > 1);
      
 SELECT *
 FROM world_life_expectancy;
 
 SELECT *
 FROM world_life_expectancy
 where status = '';
 
  SELECT distinct(status)
 FROM world_life_expectancy
 where status <> '';
 
 SELECT distinct(country)
 FROM world_life_expectancy
 where status = 'Developing';
 
 
 update world_life_expectancy
 set status = 'Developing'
 where country in (select distinct(country)
                  from  world_life_expectancy
                  where status = 'Developing');
                  
                  
                  
 set status = 'Developing'
 where country in (select distinct(country)
                  from  world_life_expectancy
                  where status = 'Developing');      
                  
                  
update world_life_expectancy t1
 join world_life_expectancy t2
      on t1.Country = t2.Country
 set t1.status = 'Developing'
 where t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developing';
 
 
 
  SELECT *
 FROM world_life_expectancy
 where Country = 'United States of America';
 
 
 update world_life_expectancy t1
 join world_life_expectancy t2
      on t1.Country = t2.Country
 set t1.status = 'Developed'
 where t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developed';
 
 
 SELECT *
 FROM world_life_expectancy;
 
 
 
 SELECT Country, Year, `Life expectancy`
 FROM world_life_expectancy
 #--where `life expectancy` = ''
 ;
 
 
 SELECT t1.Country, t1.Year, t1. `Life expectancy`,t2.Country, t2.Year, t2.`Life expectancy`
 FROM world_life_expectancy t1
 join world_life_expectancy t2
 ON t1.Country = t2.Country
 and t1.Year = t2.Year - 1;
 
 
 SELECT t1.Country, t1.Year, t1. `Life expectancy`,
 t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3. `Life expectancy`)/2,1)
 FROM world_life_expectancy t1
 join world_life_expectancy t2
 ON t1.Country = t2.Country
 and t1.Year = t2.Year - 1
 join world_life_expectancy t3
 ON t1.Country = t3.Country
 and t1.Year = t3. Year + 1
 where t1. `Life expectancy` = '';
 
 
 update world_life_expectancy t1
 join world_life_expectancy t2
      on t1.Country = t2.Country
      and t1.Year = t2.Year - 1
  join world_life_expectancy t3
    on t1.country = t3.country
    and t1.year = t3.year + 1
   set t1.`Life expectancy` = round((t2.`Life expectancy` + t3. `Life expectancy`)/2,1)
   where t1.`Life expectancy` = ''
   ;






#--EXPLORATORY DATA ANALYSIS FOR WORLD LIFE EXPECTANCY


SELECT *
 FROM world_life_expectancy;
 
 SELECT Country, 
 min(`Life expectancy`),
 max(`Life expectancy`),
 round(max(`Life expectancy`) - min(`Life expectancy`),1) as Life_Increase_15_Years
 FROM world_life_expectancy
 group by Country
 having min(`Life expectancy`) <> 0
 and max(`Life expectancy`) <> 0
 #--order by Life_Increase_15_Years desc;
 order by Life_Increase_15_Years ASC;
 
 
 
 SELECT *
 FROM world_life_expectancy;
 
 
 SELECT Year,
 round(avg(`Life expectancy`),2)
 FROM world_life_expectancy
 group by Year
 order by Year;
 
 
 SELECT *
 FROM world_life_expectancy
 ;
 

 SELECT Country, Round(AVG(`Life expectancy`),1) as Life_Exp, round(AVG(GDP),1) AS GDP
 from world_life_expectancy
 group by Country
 having Life_Exp > 0
 and GDP > 0
order by GDP asc;


select
sum(case
   when GDP >= 1500 then 1
   else 0
END)High_GDP_Count
FROM world_life_expectancy;



select
sum(case when GDP >= 1500 then 1 else 0 END) High_GDP_Count,
avg(case when GDP >= 1500 then `Life expectancy` ELSE null END) High_GDP_Life_Expectancy,
sum(case when GDP <= 1500 then 1 else 0 END) low_GDP_Count,
avg(case when GDP <= 1500 then `Life expectancy` ELSE null END) Low_GDP_Life_Expectancy
FROM world_life_expectancy;


SELECT *
 FROM world_life_expectancy
 ;
 
 SELECT Status, round(avg(`Life expectancy`),1)
 FROM world_life_expectancy
 group by Status;
 
 
 
 SELECT Status, count(DISTINCT Country), round(avg(`Life expectancy`),1)
 FRoM world_life_expectancy
 group by Status
 ;
 
 
SELECT Country, Round(AVG(`Life expectancy`),1) as Life_Exp, round(AVG(BMI),1) AS BMI
 FROM world_life_expectancy
 group by Country
 having Life_Exp > 0
 and BMI> 0
 order by BMI Asc;
 
 SELECT Country,
 Year,
 `Life expectancy`,
 `Adult Mortality`,
 sum(`Adult Mortality`) over(partition by Country order by Year) AS Rolling_Total
 from world_life_expectancy
 Where Country LIKE '%United%';
 
 
 
 FROM world_life_expectancy
 