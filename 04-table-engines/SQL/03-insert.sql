INSERT INTO series.sample_mergetree
SELECT * FROM generateRandom('uuid UUID, description Text, dt Datetime', NULL, 100) LIMIT 10000000;

select formatReadableQuantity(count(*)) from series.sample_mergetree;