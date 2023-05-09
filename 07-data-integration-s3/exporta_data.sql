-- Rodar no terminal do Docker
-- docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.parquet' FORMAT Parquet"

SELECT toString(id) AS id, description, dt
FROM study.sample_mergetree
INTO OUTFILE './sample.parquet' FORMAT Parquet