CREATE OR REPLACE TABLE series.sample_avro
(
    id String,
    description Nullable(String),
    dt Datetime
)
ENGINE = MergeTree()
ORDER BY id;


select * from series.sample_avro;