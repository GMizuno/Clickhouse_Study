SELECT * FROM mongodb(
    'mongodb:27017',
    'test',
    'my_collection',
    'test_user',
    'password',
    'log_type String, host String, command String',
    'connectTimeoutMS=10000'
)

CREATE TABLE series.mongo_my_collection
(
    log_type String,
    host String,
    command String
) ENGINE = MongoDB(
    'mongodb:27017',
    'test',
    'my_collection',
    'test_user',
    'password'
);


select * from series.mongo_my_collection;