import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/color.dart';
import 'home_screen.dart';

void main() => runApp(const StopWatch());

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: litePrimary,
      ),
    );
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Orbitron'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
