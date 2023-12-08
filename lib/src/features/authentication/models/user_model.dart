import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final double wallet;

  const UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.password,
    this.wallet = 0,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "Wallet": wallet,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      fullName: data["FullName"],
      password: data["Password"],
      wallet: data["Wallet"],
    );
  }
}
