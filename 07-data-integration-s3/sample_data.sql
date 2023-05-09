CREATE DATABASE study;

CREATE OR REPLACE TABLE study.sample_mergetree
(
    id UUID,
    description String,
    dt Datetime
)
    ENGINE = MergeTree()
        ORDER BY (dt,id);

INSERT INTO study.sample_mergetree
SELECT * FROM generateRandom('uuid UUID, description Text, dt Datetime', NULL, 100) LIMIT 10000000;