import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail.dart';
import 'forget_password_button_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(tForgetPasswordSubtitle,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 30),
            ForgetPasswordBtnWidget(
              title: tEmail,
              subtitle: tResetViaEmail,
              btnIcon: Icons.mail_lock_rounded,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
