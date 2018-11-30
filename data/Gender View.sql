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
  *
From tmp1
LEFT JOIN NamesByGender ON NamesByGender.name == First_Name ;

SELECT * FROM genderTable;


-- Remove views
drop view tmp1;
drop view genderTable;

-- Get a count
SELECT sex, count(*)
from genderTable
group by sex;
