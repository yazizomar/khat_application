import 'package:flutter/material.dart';
import 'package:khat_application/src/constants/colors.dart';

import '../../constants/sizes.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget(
      {super.key,
      required this.icon,
      required this.textButtonSubtitle,
      required this.textButtonTitle,
      required this.iconDescription,
      required this.onPressed});

  final String icon, iconDescription, textButtonSubtitle, textButtonTitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: tGreyColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('OR'),
            ),
            Expanded(
              child: Divider(
                thickness: 0.5,
                color: tGreyColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: tFormHeight - 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(
              image: AssetImage(icon),
              width: 20.0,
            ),
            onPressed: () {},
            label: Text(iconDescription),
          ),
        ),
        const SizedBox(height: tFormHeight - 10),
        TextButton(
          onPressed: onPressed,
          child: Text.rich(
            TextSpan(
              text: "$textButtonSubtitle ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: textButtonTitle.toUpperCase(),
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
