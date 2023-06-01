import 'dart:ffi';

import 'package:flutter/material.dart';
import '../model/Marks.dart';

class MarksEntry extends StatefulWidget {
  const MarksEntry({Key? key}) : super(key: key);

  @override
  State<MarksEntry> createState() => _MarksEntryState();
}

class _MarksEntryState extends State<MarksEntry> {
  String? name;
  int iotMarks = 0;
  int androidMarks =0; 
  int reactMarks=0; 
  int percentage1 = 0;
  

  List<Marks> result = [];

  _addMarks(Marks marks) {
    setState(() {
      result.add(marks);
    });
  }

  final _globalkey = GlobalKey<FormState>();

  String dropdownValue = "28A";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marks Generator"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _globalkey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => {
                    name = value,
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "name is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Student Name",
                    hintText: "Enter full name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("Select batch"),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['28A', '28B', '28C']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  onChanged: (value) => {
                    iotMarks = int.parse(value),
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Marks is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter marks of IOT",
                    hintText: "Enter IOT Marks",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onChanged: (value) => {
                    androidMarks = int.parse(value),
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Marks is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter marks of Android",
                    hintText: "Enter Android Marks",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  onChanged: (value) => {
                    reactMarks = int.parse(value),
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Marks is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter marks of React",
                    hintText: "Enter React Marks",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_globalkey.currentState!.validate()) {
                        // save name, percentage and batch and push to /result with arguments
                        Marks mark = Marks(
                          name: name,
                          batch: dropdownValue,

                          // convertig to percentage
                          percentage: ((iotMarks + androidMarks + reactMarks)/3).round(),
                          
                        );
                        _addMarks(mark);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 44, 21, 159),
                    ),
                    child: Text("Save Result")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '/result',
                            arguments: result);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 60, 22, 196),
                    ),
                    child: Text("View all result of students"))
              ],
            )),
      ),
    );
  }
}
