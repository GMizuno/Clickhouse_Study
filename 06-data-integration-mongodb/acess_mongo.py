from pymongo import MongoClient

CONNECTION_STRING = "mongodb://mongoadmin:mongoadmin@localhost:27016"
client = MongoClient(CONNECTION_STRING)

databse_name = client['user_shopping_list']
collection_name = databse_name["user_1_items"]

item_1 = {
    "_id" : "U1IT00001",
    "item_name" : "Blender",
    "max_discount" : "10%",
    "batch_number" : "RR450020FRG",
    "price" : 340,
    "category" : "kitchen appliance"
}

item_2 = {
    "_id" : "U1IT00002",
    "item_name" : "Egg",
    "category" : "food",
    "quantity" : 12,
    "price" : 36,
    "item_description" : "brown country eggs"
}
collection_name.insert_many([item_1, item_2])