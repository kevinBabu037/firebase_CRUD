import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing_farebase/firebase_options.dart';
import 'package:testing_farebase/home.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1() ,
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
    );
  }
}