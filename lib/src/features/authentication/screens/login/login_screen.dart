import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/form/form_footer_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/images_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signup_screen.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                    heightBetween: 15,
                    image: tWelcomeImage,
                    title: tLoginTitle,
                    subTitle: tloginSubtitle),
                const LoginForm(),
                FormFooterWidget(
                  icon: tUAEPassLogoImage,
                  iconDescription: tSignInWithGoogle,
                  textButtonSubtitle: tDontHaveAnAccount,
                  textButtonTitle: tSignUp,
                  onPressed: () => Get.off(() => const SignUpScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
