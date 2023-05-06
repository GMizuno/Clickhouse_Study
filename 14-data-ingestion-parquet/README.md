### generate Parquet sample
docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.parquet' FORMAT Parquet"

### create table 
create_table.sql 

### ingest AVRO 
docker exec -it clickhouse-server /bin/bash 
cd /tmp

Execute: clickhouse-client -q "INSERT INTO series.sample_parquet FORMAT Parquet" < /tmp/sample.parquet

# Data ingestion - Parquet
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD14.png"
 </a>
</p>
<div align="center">