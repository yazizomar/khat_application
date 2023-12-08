import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khat_application/src/constants/colors.dart';
import 'package:khat_application/src/constants/sizes.dart';
import 'package:khat_application/src/constants/text_strings.dart';
import 'package:khat_application/src/features/core/screens/confirmation/confirmation_page.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key, required this.rechargedAmount});
  final double rechargedAmount;

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  bool buttonState = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkButtonState);
    cardNumberController.addListener(checkButtonState);
    expirationDateController.addListener(checkButtonState);
    cvvController.addListener(checkButtonState);
  }

  void checkButtonState() {
    setState(() {
      buttonState = nameController.text.isNotEmpty &&
          cardNumberController.text.isNotEmpty &&
          expirationDateController.text.isNotEmpty &&
          cvvController.text.isNotEmpty &&
          cvvController.text.length == 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 15, 15),
        title: const Text('Add new card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name on card',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 20,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 16,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: expirationDateController,
              decoration: InputDecoration(
                labelText: 'Expiration date (MM/YY)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 5,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: cvvController,
              decoration: InputDecoration(
                labelText: 'CVV',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 3,
            ),
            const SizedBox(height: 46.0),
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
                        '${widget.rechargedAmount} AED',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: buttonState
                        ? () {
                            Get.to(() => ConfirmationScreen(
                                rechargedAmounConfirmation:
                                    widget.rechargedAmount));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (buttonState == true ? tButtonColor : tGreyColor),
                      minimumSize: const Size(double.infinity, tButtonHeight),
                    ),
                    child: Text(tContinue.toUpperCase()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
