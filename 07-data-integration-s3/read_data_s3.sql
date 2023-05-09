-- Passando credencial no s3

SELECT toDate(dt) as Data, count(*) as qtd
FROM s3('http://locahost:9001/study/sample.parquet','minio_access_key', 'minio_secret_key','Parquet')
GROUP BY toDate(dt)
ORDER BY toDate(dt) desc;

