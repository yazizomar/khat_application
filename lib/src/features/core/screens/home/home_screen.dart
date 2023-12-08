import 'package:flutter/material.dart';
import 'package:khat_application/src/constants/images_strings.dart';
import 'package:khat_application/src/features/core/screens/home/widgets/khat_wallet_card.dart';
import 'package:khat_application/src/features/core/screens/home/widgets/main_drawer.dart';

import 'widgets/linked_apps_card.dart';
import 'widgets/payment_history_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 30,
                //   width: double.infinity,
                //   decoration: BoxDecoration(color: Colors.grey[700]),
                //   child: TextButton.icon(
                //       onPressed: () {},
                //       icon: const Icon(Icons.location_on, color: Colors.white),
                //       label: const Text(
                //         "Location",
                //         style: TextStyle(color: Colors.white, fontSize: 17),
                //       )),
                // ),
                Image(
                  image: const AssetImage(tWelcomeImage),
                  height: size.height * 0.18,
                ),
                const SizedBox(height: 10),
                const KhatWallet(),
                const SizedBox(height: 40),
                const LinkedApps(),
                const SizedBox(height: 10),
                const PaymentHistory(),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
