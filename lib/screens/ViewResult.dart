import 'package:assignment_1/model/Marks.dart';
import 'package:flutter/material.dart';


class ViewResult extends StatefulWidget {
  const ViewResult({Key? key}) : super(key: key);

  @override
  State<ViewResult> createState() => _ViewResultState();
}

String dropdownValue = "28A";

class _ViewResultState extends State<ViewResult> {
  @override
  Widget build(BuildContext context) {
    
    List<Marks> results = ModalRoute.of(context)!.settings.arguments as List<Marks>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("View Result"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Text("Select Batch"),
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
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 2, 4, 56),
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                child: Text("View Results")),
            DataTable(columns: [
              DataColumn(label: Text('name')),
              DataColumn(label: Text('percentage (%)')),
              DataColumn(label: Text('Result')),
            ], 
            rows: results
                .where((marks) => marks.batch == dropdownValue)
                .map((marks) => DataRow(
                      cells: [
                        DataCell(Text(marks.name!)),
                        DataCell(Text(marks.percentage!.toString())),
                        
                        // pass or fail
                        DataCell(Text(marks.percentage! >= 40 ? "Pass" : "Fail")),
                      
                      ],
                    ))
                .toList()),
            ]),
        ),
    );
  }
}
