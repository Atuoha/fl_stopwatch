import 'package:flutter/material.dart';

import 'constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/stopwatch.gif',
          width: 120,
        ),
        const SizedBox(height: 10),
        const Text(
          'Fl Stopwatch',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: accentColor,
          ),
        ),
        const SizedBox(height: 40),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          timerBox(time: '00',title: 'Hours'),
          timerBox(time: '00',title: 'Minutes'),
          timerBox(time: '00',title: 'Seconds'),

        ]),
      ]),
    ));
  }

  Column timerBox({required String time, required String title}) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
