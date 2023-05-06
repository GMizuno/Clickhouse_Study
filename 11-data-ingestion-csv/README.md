### generate CSV sample
docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.csv' FORMAT CSV"


docker exec -it clickhouse-server /bin/bash
### create table 
create_table.sql 

### ingest CSV 
docker exec -it clickhouse-server /bin/bash 
cd /tmp

Execute: clickhouse-client -q "INSERT INTO series.sample_csv FORMAT CSV" < /tmp/sample.csv


# Data Ingestion - CSV
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD11.png"
 </a>
</p>
<div align="center">

