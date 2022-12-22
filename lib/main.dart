import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/color.dart';
import 'home_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
