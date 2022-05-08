package com.parkingmvc;

import org.bson.Document;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.Iterator;

public class Database {

        private String connectionString; // "mongodb://localhost:27017"
        private String databaseName;
        private String collectionName;

        public Database(String connectionString, String databaseName, String collectionName) {
            this.connectionString = connectionString;
            this.databaseName = databaseName;
            this.collectionName = collectionName;
    }

    public String getConnectionString() {
        return connectionString;
    }
    public void setConnectionString(String connectionString) {
        this.connectionString = connectionString;
    }
    public String getDatabaseName() {
        return databaseName;
    }   
    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }
    public String getCollectionName() {
        return collectionName;
    }
    public void setCollectionName(String collectionName) {
        this.collectionName = collectionName;
    }

    public void insertDocument(Document document) {
        MongoClientURI uri = new MongoClientURI(connectionString);
        MongoClient mongoClient = new MongoClient(uri);
        MongoDatabase database = mongoClient.getDatabase(databaseName);
        MongoCollection<Document> collection = database.getCollection(collectionName);
        collection.insertOne(document);
    }

    public void closeConnection() {
        MongoClientURI uri = new MongoClientURI(connectionString);
        MongoClient mongoClient = new MongoClient(uri);
        mongoClient.close();
    }

    public boolean isParkingSlotAvailable(String parkingslot) {
        MongoClientURI uri = new MongoClientURI(connectionString);
        MongoClient mongoClient = new MongoClient(uri);
        MongoDatabase database = mongoClient.getDatabase(databaseName);
        MongoCollection<Document> collection = database.getCollection(collectionName);
        Document document = collection.find(new Document("parkingslot", parkingslot)).first();
        if (document == null) {
            return true;
        }
        return false;
    }

    public void deleteParkingSlot(String parkingslot) {
        MongoClientURI uri = new MongoClientURI(connectionString);
        MongoClient mongoClient = new MongoClient(uri);
        MongoDatabase database = mongoClient.getDatabase(databaseName);
        MongoCollection<Document> collection = database.getCollection(collectionName);
        collection.deleteOne(new Document("parkingslot", parkingslot));
    }

    public void getDocumentsFromDatabase(){
        MongoClientURI uri = new MongoClientURI(connectionString);
        MongoClient mongoClient = new MongoClient(uri);
        MongoDatabase database = mongoClient.getDatabase(databaseName);
        MongoCollection<Document> collection = database.getCollection(collectionName);
        FindIterable<Document> iterDoc = collection.find();
        Iterator it = iterDoc.iterator();
        while (it.hasNext()) {
            System.out.println();
            System.out.println(it.next());
            System.out.println();

        }
    }
}

