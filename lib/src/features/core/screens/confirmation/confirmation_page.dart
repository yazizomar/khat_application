import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khat_application/src/constants/colors.dart';
import 'package:khat_application/src/constants/sizes.dart';
import 'package:khat_application/src/constants/text_strings.dart';
import 'package:khat_application/src/features/core/screens/home/home_screen.dart';

import '../../controllers/wallet_controller.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen(
      {super.key, required this.rechargedAmounConfirmation});
  final double rechargedAmounConfirmation;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());

    void doneClick() {
      controller.updateUserWallet(rechargedAmounConfirmation);
      Get.offAll((() => const HomeScreen()));
      Get.snackbar(
        "Success",
        "$rechargedAmounConfirmation AED has been added successfully to your wallet",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thumb_up, size: 150),
          const SizedBox(height: 30),
          Text(
            '$rechargedAmounConfirmation AED',
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 5),
          Text(
            tAddedSucces,
            style: GoogleFonts.poppins(
              color: Colors.green,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: ElevatedButton(
                onPressed: doneClick,
                style: ElevatedButton.styleFrom(
                  backgroundColor: tButtonColor,
                  minimumSize: const Size(double.infinity, tButtonHeight),
                ),
                child: Text(tDone.toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
