import 'package:flutter/material.dart';

class PickersPage extends StatefulWidget {
  const PickersPage({Key? key}) : super(key: key);

  @override
  State<PickersPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<PickersPage> {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  DateTimeRange? dateTimeRange;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'First',
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('date:$dateTime'),
                  DatePickerButton(
                    onConfirmed: (result) {
                      setState(() {
                        dateTime = result;
                      });
                    },
                  ),
                  Text('timeOfDay:$timeOfDay'),
                  TimePickerButton(
                    onConfirmed: (result) {
                      setState(() {
                        timeOfDay = result;
                      });
                    },
                  ),
                  Text('dateTimeRange:$dateTimeRange'),
                  DateRangePickerButton(
                    onConfirmed: (result) {
                      setState(() {
                        dateTimeRange = result;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DatePickerButton extends StatelessWidget {
  final Function(DateTime) onConfirmed;

  const DatePickerButton({
    required this.onConfirmed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final now = DateTime.now();

        final result = await showDatePicker(
          context: context,
          initialDate: now,
          firstDate: now.subtract(const Duration(days: 3)),
          lastDate: now.add(const Duration(days: 3)),
        );
        if (result != null) {
          onConfirmed.call(result);
        }
      },
      child: const Text("Show Date Picker"),
    );
  }
}

class TimePickerButton extends StatelessWidget {
  final Function(TimeOfDay) onConfirmed;

  const TimePickerButton({
    required this.onConfirmed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final now = TimeOfDay.now();

        final result = await showTimePicker(
          context: context,
          initialTime: now,
        );
        if (result != null) {
          onConfirmed.call(result);
        }
      },
      child: const Text("Show Time Picker"),
    );
  }
}

class DateRangePickerButton extends StatelessWidget {
  final Function(DateTimeRange) onConfirmed;

  const DateRangePickerButton({
    required this.onConfirmed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final now = DateTime.now();

        final result = await showDateRangePicker(
          context: context,
          firstDate: now.subtract(const Duration(days: 3)),
          lastDate: now.add(const Duration(days: 3)),
        );
        if (result != null) {
          onConfirmed.call(result);
        }
      },
      child: const Text("Show Date Range Picker"),
    );
  }
}
