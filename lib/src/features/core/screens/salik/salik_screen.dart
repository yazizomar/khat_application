import 'package:flutter/material.dart';
import 'widgets/deduct_card.dart';

class SalikScreen extends StatelessWidget {
  const SalikScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 116, 7, 7),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DeductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
