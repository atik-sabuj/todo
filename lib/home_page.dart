import 'package:flutter/material.dart';
import 'package:todo/result_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final DateTime _dateTime = DateTime.now();


  String dropdownvalue = 'Completed';
  var items = [
    'Completed',
    'Expired',
    'Pending',
  ];

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? dateAndTimeDeadline;

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Add ToDo'),
            actions: [
              IconButton(
              onPressed: () async {
                Navigator.pushReplacementNamed(context, ResultPage.routeName);
                },
               icon: const Icon(Icons.save),
              ),
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Title'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Description'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 8,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Choose Status'),
                        DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(dateAndTimeDeadline ?? 'Choose Deadline'),
                        ElevatedButton(
                          onPressed: () {
                            selectDate();
                          },
                          child: const Text('Select'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  Column showCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
          },
          child: Row(
            children: const [Icon(Icons.add), Text('Create Category')],
          ),
        ),
      ],
    );
  }

  void selectDate() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (selectedDate != null) {
      selectedTime =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
      setState(() {});
    }
  }

  void _saveTodo() async {
    String title = _titleController.text;
    String desc = _descriptionController.text;

  }
}
