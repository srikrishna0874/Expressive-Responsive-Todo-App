import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constants.dart';

class MongoDataBase {
  static connect() async {
    print("\n\n\n\nHI\n\n\n\n\n");
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print("\n\n\n\n\n\n${status}\n\n\n\n\n\n");
    var collectionUsers = db.collection(COLLECTION_NAME1);

    print(await collectionUsers.find().toList());
  }
}
