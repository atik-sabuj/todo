import 'package:flutter/material.dart';
import 'package:todo/home_page.dart';
import 'package:todo/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      initialRoute: HomePage.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
      ResultPage.routeName: (context) => ResultPage(),
    }
    );
  }
}

