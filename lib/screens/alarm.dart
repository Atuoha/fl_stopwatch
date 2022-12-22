import 'package:flutter/material.dart';

class AlarmClock extends StatefulWidget {
  const AlarmClock({Key? key}) : super(key: key);

  @override
  State<AlarmClock> createState() => _AlarmClockState();
}

class _AlarmClockState extends State<AlarmClock> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Alarm Clock'));
  }
}
