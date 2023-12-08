import 'package:flutter/material.dart';

class DeductCard extends StatelessWidget {
  const DeductCard({super.key});

  @override
  Widget build(context) {
    return Card(
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
            Text("Toll Unpaid Fees"),
            SizedBox(height: 10),
            Divider(
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.monetization_on),
                SizedBox(width: 10),
                Text("20 AED"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
