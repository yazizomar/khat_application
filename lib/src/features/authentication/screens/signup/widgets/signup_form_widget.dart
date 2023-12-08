import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/features/authentication/models/user_model.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => controller.fullNameValidator(value),
              controller: controller.fullname,
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(Icons.person_outline_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) => controller.emailValidator(value),
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) => controller.passwordValidator(value),
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      fullName: controller.fullname.text.trim(),
                      password: controller.password.text.trim(),
                    );

                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(tSignUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
