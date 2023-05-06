# READ DATA FROM S3 
SELECT * FROM s3('http://minio:9000/series/sample.parquet','minio_access_key', 'minio_secret_key','Parquet')

SELECT toDate(dt),count(*)
FROM s3('http://minio:9000/series/sample.parquet','minio_access_key', 'minio_secret_key','Parquet')
GROUP BY toDate(dt)
ORDER BY toDate(dt) desc;


