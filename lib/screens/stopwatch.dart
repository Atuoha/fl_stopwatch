import 'dart:async';
import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../widgets/build_elevated_button.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration duration = const Duration();
  Timer? timer;
  bool timerRunningStatus = false;
  bool timerStarted = true;

  String convertToTwoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void initState() {
    super.initState();
    restartTimer();
  }

  cancelTimer() {
    timer!.cancel();
    setState(() {
      duration = const Duration();
      timerRunningStatus = false;
    });
  }

  addTime() {
    setState(() {
      duration += const Duration(seconds: 1);
    });
  }

  startTimer({required bool isFirstRun}) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
    setState(() {
      if (timerStarted) {
        timerRunningStatus = true;
      }
      if (!isFirstRun) {
        timerStarted = !timerStarted;
      }
    });
  }

  void restartTimer() {
    setState(() {
      duration = const Duration();
    });
  }

  void stopTimer() {
    setState(() {
      // duration += const Duration(seconds: 0);
      timer!.cancel();
      timerStarted = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              timerBox(
                time: convertToTwoDigits(duration.inHours),
                title: 'Hours',
              ),
              timerBox(
                time: convertToTwoDigits(duration.inMinutes.remainder(60)),
                title: 'Minutes',
              ),
              timerBox(
                time: convertToTwoDigits(duration.inSeconds.remainder(60)),
                title: 'Seconds',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (timerRunningStatus) ...[
                BuildElevatedButton(
                  icon: Icons.restart_alt,
                  title: 'Restart',
                  fnc: () => restartTimer(),
                ),
                const SizedBox(width: 10),
                BuildElevatedButton(
                  icon: timerStarted
                      ? Icons.stop_circle_outlined
                      : Icons.play_circle,
                  title: timerStarted ? 'Stop' : 'Play',
                  fnc: () => timerStarted
                      ? stopTimer()
                      : startTimer(isFirstRun: false),
                ),
                const SizedBox(width: 10),
                timerStarted
                    ? BuildElevatedButton(
                        icon: Icons.cancel,
                        title: 'Cancel',
                        fnc: () => cancelTimer(),
                      )
                    : const SizedBox.shrink(),
              ] else ...[
                BuildElevatedButton(
                  icon: Icons.play_circle,
                  title: 'Start Stopwatch',
                  fnc: () => startTimer(isFirstRun: true),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Column timerBox({
    required String time,
    required String title,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 105,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
