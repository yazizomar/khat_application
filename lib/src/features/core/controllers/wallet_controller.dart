import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/repository/authentication_repository/authentication_repository.dart';
import 'package:khat_application/src/repository/user_repository/user_repository.dart';

class WalletController extends GetxController {
  static WalletController get instance => Get.find();

  final amount = TextEditingController();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  String? validateRechargeAmount(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the recharge amount';
    }
    // Ensure the amount is a valid number
    try {
      double amount = double.parse(value);
      if (amount <= 0) {
        return 'Amount must be greater than zero';
      }
      // You can add additional checks for maximum recharge amount if needed
    } catch (e) {
      return 'Please enter a valid number';
    }
    return null;
  }

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateUserWallet(double amount) async {
    await _userRepo.updateUserRecord(amount);
  }
}
