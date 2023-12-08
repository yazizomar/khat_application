import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/constants/colors.dart';
import 'package:khat_application/src/constants/sizes.dart';
import 'package:khat_application/src/constants/text_strings.dart';
import 'package:khat_application/src/features/core/screens/add_new_card/add_new.dart';
import 'package:khat_application/src/features/core/screens/confirmation/confirmation_page.dart';
import 'package:khat_application/src/features/core/screens/home/home_screen.dart';

import '../../../../constants/icons/my_flutter_app_icons.dart';
import 'widgets/card_design.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.rechargeAmount});
  final double rechargeAmount;

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedOption;

  void navigateToNextScreen() {
    if (selectedOption == 4) {
      Get.to(() => AddNewCard(
            rechargedAmount: widget.rechargeAmount,
          ));
    } else if (selectedOption == 1 ||
        selectedOption == 2 ||
        selectedOption == 3) {
      Get.to(
        () => ConfirmationScreen(
            rechargedAmounConfirmation: widget.rechargeAmount),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tPayWith),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(() => const HomeScreen());
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  tRecommmended,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 4.0),
                CardDesign(
                  icon: Icons.credit_card_rounded,
                  title: tPayWithLast,
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "OR",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const Expanded(
                      child: Divider(),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                CardDesign(
                  icon: MyFlutterApp.apple_pay,
                  title: tApplePay,
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                CardDesign(
                  icon: Icons.compare_arrows_rounded,
                  title: tBankTransfer,
                  value: 3,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                CardDesign(
                  icon: Icons.add_card_rounded,
                  title: tAddNewCard,
                  value: 4,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(tTotalAmount,
                              style: Theme.of(context).textTheme.bodyLarge),
                          Text(
                            '${widget.rechargeAmount} AED',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          navigateToNextScreen();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (selectedOption != null
                              ? tButtonColor
                              : tGreyColor),
                          minimumSize:
                              const Size(double.infinity, tButtonHeight),
                        ),
                        child: Text(tContinue.toUpperCase()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
