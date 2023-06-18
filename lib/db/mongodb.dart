import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constants.dart';

class MongoDataBase {
  static connect() async {
    print("\n\n\n\nConnection Started...\n\n\n\n\n");
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status=db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME1);
    print("Connection Successfully...");
  }
}
