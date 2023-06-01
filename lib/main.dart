import 'package:assignment_1/screens/MarksEntry.dart';
import 'package:assignment_1/screens/ViewResult.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/':(context) => const MarksEntry(),
        '/result':(context) => const ViewResult(),
      },
    );
  }
}
