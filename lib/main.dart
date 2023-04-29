import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowDatePicker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Select Date')),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                DateTime? dateSelected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(3000));
                if (dateSelected != null) {
                  print(
                      'I Selected: ${dateSelected.year} - ${dateSelected.month} - ${dateSelected.day}');
                }
              },
              child: Text('Clcke Here'),
            ),
          ),
          Text('Select Time'),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  TimeOfDay? timePicked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input);
                  if (timePicked != null) {
                    print(
                        'I Seleced: ${timePicked.hour} - ${timePicked.minute}');
                  }
                },
                child: Text('Time')),
          )
        ],
      ),
    );
  }
}
