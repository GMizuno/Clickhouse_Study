/* fetch millions of rows*/
SELECT * FROM generateRandom('uuid UUID, description Text, dt Datetime', NULL, 100) LIMIT 1000000;