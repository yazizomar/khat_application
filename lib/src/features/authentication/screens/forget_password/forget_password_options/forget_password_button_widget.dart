import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subtitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(btnIcon, size: 60),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            )
          ],
        ),
      ),
    );
  }
}
