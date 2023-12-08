import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class ForgetController extends GetxController {
  static ForgetController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();

  /// TextField Validation
  String? emailValidator(value) {
    if (value.isEmpty || value == null) return 'Enter your email';
    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  //Call this Function from Design & it will do the rest
  void forgetPassword(String email) {
    String? error = AuthenticationRepository.instance
        .forgetPasswordWithEmail(email) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }
}
