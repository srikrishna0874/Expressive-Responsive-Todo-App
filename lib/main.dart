import 'package:flutter/material.dart';

import 'db/mongodb.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await MongoDataBase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List App',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
