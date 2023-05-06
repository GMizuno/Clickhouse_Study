# MongoDb 

### connect to mongodb container
docker exec -it mongodb mongo -u mongoadmin -p mongoadmin

### execute command below inside mongo
use test

db.createUser({user:"test_user",pwd:"password",roles:[{role:"readWrite",db:"test"}]})

db.createCollection("my_collection")

db.my_collection.insertOne(
    { log_type: "event", host: "120.5.33.9", command: "check-cpu-usage -w 75 -c 90" }
)

db.my_collection.insertOne(
    { log_type: "event", host: "120.5.33.11", command: "check-ram-usage 60" }
)

db.my_collection.insertOne(
    { log_type: "event", host: "120.5.33.4", command: "system-check"}
)

# Excute on dbeaver or other or with CLI (clickhouse-client)
mongodb.sql have clickhouse SQL samples how to fetch data from mongodb

# Data integration - Mongodb 
<p align="center">
  <a href="" rel="noopener">
    <img src="https://github.com/owshq-plumbers/series-clickhouse/blob/main/images/VD06.png"
 </a>
</p>
<div align="center">
