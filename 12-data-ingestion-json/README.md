### generate JSON sample
docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.json' FORMAT JSONEachRow"

### create table 
create_table.sql 

### ingest JSON 
docker exec -it clickhouse-server /bin/bash 
cd /tmp

Execute: clickhouse-client -q "INSERT INTO series.sample_json FORMAT JSONEachRow" < /tmp/sample.json

# Data ingestion - JSON
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD12.png"
 </a>
</p>
<div align="center">