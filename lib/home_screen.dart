import 'package:flutter/material.dart';
import 'constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void restart() {
    print('restart');
  }

  void stop() {
    print('stop');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timerBox(time: '00', title: 'Hours'),
                timerBox(time: '00', title: 'Minutes'),
                timerBox(time: '00', title: 'Seconds'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElevatedButton(
                  icon: Icons.restart_alt,
                  title: 'Restart',
                  fnc: () => restart(),
                ),
                const SizedBox(width: 10),
                buildElevatedButton(
                  icon: Icons.stop_circle_outlined,
                  title: 'Stop',
                  fnc: () => stop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Directionality buildElevatedButton({
    required IconData icon,
    required String title,
    required Function fnc,
  }) =>
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(icon),
          onPressed: () => fnc(),
          label: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  Column timerBox({
    required String time,
    required String title,
  }) {
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
