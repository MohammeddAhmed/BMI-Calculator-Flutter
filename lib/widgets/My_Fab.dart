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
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      padding: const EdgeInsets.all(16),
      shape: const CircleBorder(),
      fillColor: color,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
