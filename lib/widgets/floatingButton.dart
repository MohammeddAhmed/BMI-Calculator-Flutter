import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final Color color;
  const MyFab({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(
        minHeight: 86,
        maxWidth: 86,
      ),
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(12),
      fillColor: color,
      onPressed: onPressed,
      child: Icon(
        icon,
      ),
    );
  }
}
