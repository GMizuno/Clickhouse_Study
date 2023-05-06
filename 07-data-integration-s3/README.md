### generate parquet sample data 
docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.parquet' FORMAT Parquet"

### copy file from docker to local 
docker cp clickhouse-server:/tmp/sample.parquet /tmp/

### Go to minio 
http://localhost:9001

 MINIO_ROOT_USER: minio_access_key
 MINIO_ROOT_PASSWORD: minio_secret_key

Create a bucket with name: series
Upload file sample.parquet to bucket

# Data integration - S3
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD07.png"
 </a>
</p>
<div align="center">
