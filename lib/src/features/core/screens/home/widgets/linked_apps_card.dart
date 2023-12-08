import 'package:flutter/material.dart';
import 'package:khat_application/src/constants/images_strings.dart';
import 'package:khat_application/src/constants/sizes.dart';
import 'package:khat_application/src/constants/text_strings.dart';

import '../../../../../common_widgets/card/card_header_widget.dart';
import 'components/square_tile_home.dart';

class LinkedApps extends StatelessWidget {
  const LinkedApps({super.key});

  // void onTap(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         //return const SalikScreen();
  //       },
  //     ),
  //   );
  // }

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
            CardHeader(title: tLinkedApp, icon: Icons.link_sharp),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SquareTileHome(
                  imagePath: tSalikLogoImage,
                  app: "salik",
                ),
                SizedBox(width: 20),
                SquareTileHome(
                  imagePath: tDarbLogoImage,
                  app: "darb",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
