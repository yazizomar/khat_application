import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/form/form_footer_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/images_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';
import 'widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  heightBetween: 15,
                  image: tWelcomeImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubtitle,
                ),
                const SignUpFormWidget(),
                FormFooterWidget(
                  icon: tUAEPassLogoImage,
                  iconDescription: tSignInWithGoogle,
                  textButtonSubtitle: tAlreadyHaveAnAccount,
                  textButtonTitle: tLogin,
                  onPressed: () => Get.off(() => const LoginScreen()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
