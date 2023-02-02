import 'package:flutter/material.dart';
import 'package:todo/home_page.dart';
import 'package:todo/model/model.dart';

class ResultPage extends StatefulWidget {
  static const String routeName = '/result_page';
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  final List<Map> myProducts =
  List.generate(10, (index) => {"id": index, "title": "Title$index"})
      .toList();



  List<Data> todoList = [];

  pushList() {
    TodoModel(data: todoList);
  }


  addTodo(Data data) {
    todoList.add(data);
  }


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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(myProducts[index]["title"]),
              );
            }
            ),
      ),
    );
  }
}
