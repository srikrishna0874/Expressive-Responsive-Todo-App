import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constants.dart';

class MongoDataBase {
  /*static connect() async {
    print("\n\n\n\nConnection Started...\n\n\n\n\n");
    var db = await Db.create(MONGO_URL);
    db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    collectionUsers = db.collection(COLLECTION_NAME1);
    print("Connection Successfully...");
  }*/

  Future<void> insertForSignUp(
      String username, String email, String password) async {
    var db = await Db.create(MONGO_URL);
    print("Connection success\n\n\n\n");
    db
        .open()
        .then((value) => print("Opened successfully db"))
        .onError((error, stackTrace) => print("Failed in db.open()"));
    print("Server status is ${db.serverStatus()}");
    print("DB opened\n\n\n\n\n");
    var collectionUsers = db.collection(COLLECTION_NAME1);
    print(collectionUsers);
    print("Declared Collection variable\n\n\n\n");
    await collectionUsers
        .insertOne({"Username": username, "Email": email, "Password": password})
        .then((value) => print("Inserted Successfully"))
        .onError((error, stackTrace) =>
            print("\n\n\n\n${error}\n\n\n\nyedava bratuku\n\n\n\n"));
    await db.close();
  }
}
