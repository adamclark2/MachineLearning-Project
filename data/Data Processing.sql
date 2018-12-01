--  Nov is 11
--  APR is 4

-- Insert Data Into Table
-- I did this for each csv file
INSERT into UMSDataNew SELECT *, 2018 as 'Year', 11 as 'Month' FROM UMSData;
SELECT distinct Year, Month From UMSDataNew;

-- Remove From Staging Table
DELETE from UMSData WHERE 1=1;
SELECT * FROM UMSData;

-- All the CSV Files...
SELECT distinct Year, Month From UMSDataNew;


-- Delete All
DELETE FROM UMSData WHERE 1=1;
DELETE FROM UMSDataNew WHERE 1=1;