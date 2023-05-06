# Postgres configuration 

## create table on postgres
docker exec -it postgres psql --user postgres -c "CREATE TABLE uk_postcode_to_iso
(
        id serial,
    	postcode varchar(8) primary key,
    	iso_code char(6)
);"

## create indexes
docker exec -it postgres psql --user postgres -c "CREATE INDEX ON uk_postcode_to_iso (iso_code);"

## ingest data on postgres
docker exec -i postgres psql --user postgres < uk_postcode_to_iso.sql

## verify if data loadead
docker exec -it postgres psql --user postgres -c "select count(*) from uk_postcode_to_iso;"


## download dataset inside home folder 05-database-engines
wget https://datasets-documentation.s3.eu-west-3.amazonaws.com/uk-house-prices/postgres/uk_prices.sql.tar.gz

## extract tar.gz (this dataset has approximately 4Gb of data)
tar -xf uk_prices.sql.tar.gz 

## create table uk_price_paid on postgres
docker exec -it postgres psql --user postgres -c "CREATE TABLE uk_price_paid
(
   id integer primary key generated always as identity,
   price INTEGER,
   date Date,
   postcode1 varchar(8),
   postcode2 varchar(3),
   type varchar(13),
   is_new SMALLINT,
   duration varchar(9),
   addr1 varchar(100),
   addr2 varchar(100),
   street varchar(60),
   locality varchar(35),
   town varchar(35),
   district varchar(40),
   county varchar(35)
);"

## create index uk_price_paid on postgres
docker exec -it postgres psql --user postgres -c "CREATE INDEX ON uk_price_paid (type)"
docker exec -it postgres psql --user postgres -c "CREATE INDEX ON uk_price_paid (town)"
docker exec -it postgres psql --user postgres -c "CREATE INDEX ON uk_price_paid (extract(year from date))"

## ingest data to table uk_price_paid
docker exec -i postgres psql --user postgres < uk_prices.sql

## verify if data loadead
docker exec -it postgres psql --user postgres -c "select count(*) from uk_price_paid;"


## test query on table uk_price_paid
docker exec -it postgres psql --user postgres -c  "\timing" -c "SELECT
	extract(year from date) as year,
	round(avg(price)) AS price
FROM uk_price_paid
WHERE type = 'flat'
GROUP BY year
ORDER BY year"


# Clickhouse configuration to connect postgres

CREATE DATABASE postgres
ENGINE = PostgreSQL('postgres:5432', 'postgres', 'postgres', 'postgres_password', 'public',1);

select count(*) from postgres.uk_price_paid;

SELECT
      postcode1,
      round(avg(price)) AS price
FROM postgres.uk_price_paid upp  
WHERE town='BRISTOL' AND postcode1 != ''
GROUP BY postcode1
ORDER BY price DESC LIMIT 100;

## Ingest data from postgres to Clickhouse

#### using DBEaver or other or clickhouse CLI to create database and table 
docker exec -it clickhouse-server clickhouse-client 

CREATE DATABASE uk;

CREATE TABLE uk.uk_price_paid
(
   `price` UInt32,
   `date` Date,
   `postcode1` LowCardinality(String),
   `postcode2` LowCardinality(String),
   `type` Enum8('other' = 0, 'terraced' = 1, 'semi-detached' = 2, 'detached' = 3, 'flat' = 4),
   `is_new` UInt8,
   `duration` Enum8('unknown' = 0, 'freehold' = 1, 'leasehold' = 2),
   `addr1` String,
   `addr2` String,
   `street` LowCardinality(String),
   `locality` LowCardinality(String),
   `town` LowCardinality(String),
   `district` LowCardinality(String),
   `county` LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY (type, town, postcode1, postcode2)

### Connect with CLI the clickhouse server 
docker exec -it clickhouse-server clickhouse-client 

#### execute this INSERT statment inside CH
insert into uk.uk_price_paid select * EXCEPT id from postgres.uk_price_paid;



# Database engines
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD05.png"
 </a>
</p>
<div align="center">



