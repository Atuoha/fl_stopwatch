import 'package:flutter/material.dart';

import '../constants/color.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.fnc,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function fnc;

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
  }
}
