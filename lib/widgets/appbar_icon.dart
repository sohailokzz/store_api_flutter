import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final Function function;
  final IconData icon;
  const AppBarIcon({
    super.key,
    required this.function,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
