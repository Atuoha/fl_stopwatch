import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../constants/color.dart';
import '../widgets/build_elevated_button.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  final ConfettiController confettiController = ConfettiController();
  Duration duration = const Duration();
  Timer? timer;
  int seconds = 0;
  bool isFirstRun = true;
  bool isStarted = false;
  bool isPlaying = false;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    restartCountDown();
    confettiController.play();
  }

  @override
  void dispose() {
    super.dispose();
    confettiController.dispose();
  }

  reduceCount() {
    setState(() {
      if (duration.inSeconds != 0) {
        duration -= const Duration(seconds: 1);
      } else {
        setState(() {
          isCompleted = true;
          confettiController.play();
        });
      }
    });
  }

  startCountDown() {
    if (isFirstRun) {
      setState(() {
        isStarted = true;
        isFirstRun = !isFirstRun;
        isPlaying = true;
      });
    } else {
      setState(() {
        isPlaying = true;
      });
    }
    timer =
        Timer.periodic(const Duration(seconds: 1), (timer) => reduceCount());
  }

  stopCountDown() {
    setState(() {
      timer!.cancel();
      isPlaying = false;
    });
  }

  restartCountDown() {
    setState(() {
      duration = Duration(seconds: seconds);
      isPlaying = true;
      isCompleted = false;
    });
  }

  cancelCountDown() {
    restartCountDown();
    setState(() {
      isFirstRun = true;
      isPlaying = false;
      isStarted = false;
      isCompleted = false;
      seconds = 0;
      duration = Duration(seconds: seconds);
    });
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isCompleted
              ? Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ConfettiWidget(
                        confettiController: confettiController,
                        colors: const [
                          primaryColor,
                          accentColor,
                        ],
                        numberOfParticles: seconds + 20,
                        blastDirectionality: BlastDirectionality.explosive,
                        gravity: 1,
                        // blastDirection: pi,
                      ),
                    ),
                    const Text(
                      'Count Down Completed! 🎉🎊',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              : Text(
                  'Seconds: ${duration.inSeconds}',
                  style: const TextStyle(fontSize: 50),
                ),
          const SizedBox(height: 30),
          if (isStarted) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildElevatedButton(
                  icon: Icons.restart_alt,
                  title: 'Restart',
                  fnc: () => restartCountDown(),
                ),
                const SizedBox(width: 10),
                BuildElevatedButton(
                  icon: isPlaying
                      ? Icons.stop_circle_outlined
                      : Icons.play_circle,
                  title: isPlaying ? 'Stop' : 'Play',
                  fnc: () => isPlaying
                      ? stopCountDown()
                      : startCountDown(),
                ),
                const SizedBox(width: 10),
                isPlaying
                    ? BuildElevatedButton(
                        icon: Icons.cancel,
                        title: 'Cancel',
                        fnc: () => cancelCountDown(),
                      )
                    : const SizedBox.shrink(),
              ],
            )
          ] else ...[
            const Text(
              'Pick duration  (measured in seconds)',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            NumberPicker(
              axis: Axis.horizontal,
              value: seconds,
              minValue: 0,
              maxValue: 100,
              textStyle: const TextStyle(fontSize: 18),
              selectedTextStyle: const TextStyle(
                fontSize: 35,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) => setState(() {
                seconds = value;
                duration = Duration(seconds: value);
              }),
            ),
            BuildElevatedButton(
              icon: Icons.play_circle,
              title: 'Start Count down',
              fnc: () => startCountDown(),
            ),
          ]
        ],
      ),
    );
  }
}
