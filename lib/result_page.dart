import 'package:flutter/material.dart';
import 'package:todo/home_page.dart';

class ResultPage extends StatefulWidget {
  static const String routeName = '/result_page';
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result Page'),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Column(

      )
    );
  }
}
