import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fl_stopwatch/screens/alarm.dart';
import 'package:fl_stopwatch/screens/countdown.dart';
import 'package:fl_stopwatch/screens/stopwatch.dart';
import 'package:flutter/material.dart';
import 'constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  final List<Widget> _pages = const [
    StopWatch(),
    CountDown(),
    AlarmClock(),
  ];

  selectPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        initialActiveIndex: currentIndex,
        backgroundColor: primaryColor,
        onTap: (index) => selectPage(index),
        items: [
          buildTabItem(icon: Icons.timer_outlined, index: 0),
          buildTabItem(icon: Icons.hourglass_empty, index: 1),
          buildTabItem(icon: Icons.alarm_on, index: 2)
        ],
      ),
      body: _pages[currentIndex],
    );
  }

  TabItem<dynamic> buildTabItem({
    required IconData icon,
    required int index,
  }) {
    return TabItem(
      icon: Icon(
        icon,
        color: currentIndex == index ? primaryColor : Colors.white,
      ),
    );
  }
}
