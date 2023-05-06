### generate AVRO sample
docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.avro' FORMAT Avro"

### create table 
create_table.sql 

### ingest AVRO 
docker exec -it clickhouse-server /bin/bash 
cd /tmp

Execute: clickhouse-client -q "INSERT INTO series.sample_avro FORMAT Avro" < /tmp/sample.avro

# Data ingestion - AVRO
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD13.png"
 </a>
</p>
<div align="center">