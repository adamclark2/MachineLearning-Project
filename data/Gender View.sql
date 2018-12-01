-- Names by gender contains
-- The names by gender table contains
-- Occurences of the names by gender
--
-- Turns out there are male and female 'Stephen'(s)
SELECT name,sex,max(count) FROM NamesByGender
GROUP BY name;


-- Remove views
drop view tmp1;
drop view genderTable;


-- Code to get genders
CREATE VIEW tmp1 as
SELECT
  substr(Formatted_Name, 0, charindex(',', Formatted_Name)) as Last_Name,

  substr(
  Formatted_Name,
  charindex(' ', Formatted_Name) + 1, length(Formatted_Name)
)
as First_Name_And_Middle,
  *
From UMSDataNew;

CREATE VIEW genderTable as
SELECT
    substr(
        First_Name_And_Middle,0, charindex(' ', First_Name_And_Middle)
    )
    as First_Name,
  *, MAX(count)
From tmp1
LEFT JOIN NamesByGender ON NamesByGender.name == First_Name
GROUP BY CMP,Formatted_Name,Title,Salbase,JobSt,"Bargaining Unit","Faculty Appt",FTE,Year,Month;

SELECT * FROM genderTable where name='Stephen';

SELECT * FROM UMSDataNew;
SELECT * FROM genderTable;


-- Get a count
SELECT sex, count(*)
from genderTable
group by sex;


SELECT * from genderTable where Salbase >= 500000;