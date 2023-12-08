import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/repository/user_repository/user_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();

  final userRepo = Get.put(UserRepository());

  String? fullNameValidator(value) {
    if (value.isEmpty || value == null) return 'Enter your full name';
    return null;
  }

  String? emailValidator(value) {
    if (value.isEmpty || value == null) return 'Enter your email';
    if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value.isEmpty || value == null) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
  }
}
