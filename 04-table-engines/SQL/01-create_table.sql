CREATE DATABASE series;

CREATE OR REPLACE TABLE series.sample_mergetree
(
    id UUID,
    description String,
    dt Datetime
)
ENGINE = MergeTree()
ORDER BY (dt,id);
