import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/features/authentication/controllers/forget_controller.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/images_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetController());
    final _formkey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize * 4),
                FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tForgetPassword.toUpperCase(),
                  subTitle: tForgetPasswordSubtitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => controller.emailValidator(value),
                        controller: controller.email,
                        decoration: const InputDecoration(
                            label: Text(tEmail),
                            hintText: tEmail,
                            prefixIcon: Icon(Icons.mail_outline_rounded)),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  controller.forgetPassword(
                                      controller.email.text.trim());
                                }
                              },
                              child: const Text(tNext))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
