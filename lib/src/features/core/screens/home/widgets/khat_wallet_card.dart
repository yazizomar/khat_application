import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/common_widgets/card/card_header_widget.dart';
import 'package:khat_application/src/constants/colors.dart';
import 'package:khat_application/src/constants/text_strings.dart';
import 'package:khat_application/src/features/core/controllers/wallet_controller.dart';
import 'package:khat_application/src/features/core/screens/payment/payment_screen.dart';

import '../../../../../constants/sizes.dart';
import '../../../../authentication/models/user_model.dart';

class KhatWallet extends StatefulWidget {
  const KhatWallet({super.key});

  @override
  State<KhatWallet> createState() {
    return _KhatWalletState();
  }
}

class _KhatWalletState extends State<KhatWallet> {
  final controller = Get.put(WalletController());
  void payClick(BuildContext context, double amount) {
    Get.to(() => PaymentScreen(rechargeAmount: amount));
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: tHomeCardPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardHeader(title: tKhatWallet, icon: Icons.wallet),
            const SizedBox(height: 10),
            FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Row(
                      children: [
                        Text(tAccountBalance,
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(width: 5),
                        Text(
                          "${userData.wallet} AED",
                          style: Theme.of(context).textTheme.labelSmall,
                        ), //from database
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(child: Text("Something went wrong"));
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black87),
                  );
                }
              },
            ),
            const SizedBox(height: 30),
            Text(tEnterRecharge, style: Theme.of(context).textTheme.labelSmall),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) =>
                        controller.validateRechargeAmount(value),
                    controller: controller.amount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: tRechargeAmount,
                      hintText: tHintText,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          payClick(
                              context,
                              double.tryParse(controller.amount.text.trim()) ??
                                  0);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tButtonColor,
                        minimumSize:
                            const Size(double.infinity, tButtonHeight)),
                    child: const Text(tPayRecharge),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
