// ignore_for_file: body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/models/user_model.dart';
import '../authentication_repository/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _authRepo = Get.put(AuthenticationRepository());

  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").doc(user.email).set(user.toJson()).catchError(
      (error, stackTrace) {
        Get.snackbar("Error", "Something went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        print("ERROR - $error");
      },
    );
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData =
        snapshot.docs.map((user) => UserModel.fromSnapshot(user)).single;
    await updateUserRecord(0);
    return userData;
  }

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db.collection("Users").get();
    final usersData =
        snapshot.docs.map((users) => UserModel.fromSnapshot(users)).toList();

    return usersData;
  }

  Future<void> updateUserRecord(double amount) async {
    await _db
        .collection("Users")
        .doc(_authRepo.firebaseUser.value?.email)
        .update({'Wallet': FieldValue.increment(amount)});
  }
}
