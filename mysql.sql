-- Active: 1690264804080@@127.0.0.1@3306
SHOW DATABASES;;

SELECT
# Use the supermarket database after we export csv table to there
USE supermarket;

# After we export csv to sequel let's start edit the database
SHOW TABLES;

# Let's see what's data looks like
SELECT * FROM supermarket LIMIT 5;

# Let's see total of payment and gross `gross income`
SELECT SUM('gross income') FROM supermarket;
SELECT SUM(`gross income`) FROM supermarket;
SELECT SUM(cogs) from supermarket;
# Distribution of Customer's Rating
SELECT Rating, COUNT(*) FROM supermarket GROUP BY `Rating` ORDER BY `Rating` DESC;

# The sales performa of every each branch
SELECT `Branch`, COUNT(*) FROM supermarket GROUP BY `Branch` ORDER BY `Branch`;

# The rating performa of each branch
SELECT `Branch`, SUM(`Rating`) FROM supermarket GROUP BY `Branch` ORDER BY `Branch`;

# The sales of different type of payment
SELECT `Payment`, COUNT(*) FROM supermarket GROUP BY `Payment` ORDER BY `Payment`;

SELECT `Payment`, SUM(`Rating`) FROM supermarket GROUP BY `Payment` ORDER BY `Payment`;

# create a table with average numerical features from every date
CREATE TABLE date_sales AS 
(SELECT `Date`, AVG(`Unit price`), AVG(`Quantity`), AVG(`Tax 5%`), AVG(`Total`), AVG(cogs), AVG(`gross income`), AVG(`Rating`)
FROM supermarket GROUP BY `Date` ORDER BY `Date`);

# open the table we has created
SELECT * FROM date_sales;

# See what's the most `Product line` that makes `gross income`
SELECT `Product line`, SUM(`gross income`) FROM supermarket GROUP BY `Product line` 
ORDER BY SUM(`gross income`) DESC;


SELECT * FROM supermarket;
ALTER TABLE supermarket ADD COLUMN `Date Formatted` DATE;
# Let's see the month gross income
UPDATE supermarket
SET `Date Formatted` = (SELECT STR_TO_DATE(`Date`, "%m/%d/%Y") );

# Make a Month Pivot Table
SELECT MONTHNAME(`Date Formatted`), AVG(`Unit price`), AVG(`Quantity`), 
AVG(`Tax 5%`), AVG(`Total`), AVG(cogs), AVG(`gross income`), AVG(`Rating`) 
FROM supermarket GROUP BY MONTHNAME(`Date Formatted`);



