### generate parquet sample data 
docker exec -it clickhouse-server clickhouse-client -q "SELECT toString(id) as id,description,dt FROM series.sample_mergetree INTO OUTFILE '/tmp/sample.parquet' FORMAT Parquet"

### copy file from docker to local 
docker cp clickhouse-server:/tmp/sample.parquet ./sample.parquet

### Go to minio 
http://localhost:9001

 MINIO_ROOT_USER: minio_access_key
 MINIO_ROOT_PASSWORD: minio_secret_key

Create a bucket with name: series
Upload file sample.parquet to bucket

