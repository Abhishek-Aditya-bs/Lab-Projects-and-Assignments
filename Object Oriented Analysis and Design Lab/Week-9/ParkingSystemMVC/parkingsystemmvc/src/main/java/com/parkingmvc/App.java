package com.parkingmvc;

public class App {
    
    public static void main(String[] args) {
        Model model = new Model("", "", "", "", "", "", "", "", "", "", "", "", "");
        View view = new View("Parking System");
        Database database = new Database("mongodb://localhost:27017", "parkingSystem", "users");
        database.getDocumentsFromDatabase();
        Controller controller = new Controller(model, view, database);
        controller.initController();
    }
}
// "mongodb://localhost:27017"
// "mongodb://abhiadi110:Xwt4a7_Mongo@main-shard-00-00.cpssw.mongodb.net:27017,main-shard-00-01.cpssw.mongodb.net:27017,main-shard-00-02.cpssw.mongodb.net:27017/myFirstDatabase?ssl=true&replicaSet=atlas-14m9et-shard-0&authSource=admin&retryWrites=true&w=majority"