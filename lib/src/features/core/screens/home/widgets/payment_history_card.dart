import 'package:flutter/material.dart';
import 'package:khat_application/src/common_widgets/card/card_header_widget.dart';
import 'package:khat_application/src/constants/text_strings.dart';

import '../../../../../constants/sizes.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({super.key});

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: tHomeCardPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeader(
                title: tPaymentHistory, icon: Icons.calendar_month_sharp),
          ],
        ),
      ),
    );
  }
}
