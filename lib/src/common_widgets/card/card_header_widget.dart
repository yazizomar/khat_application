import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
