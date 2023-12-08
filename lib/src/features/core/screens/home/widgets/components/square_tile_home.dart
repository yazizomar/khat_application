//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SquareTileHome extends StatelessWidget {
  final String imagePath;
  const SquareTileHome({
    super.key,
    required this.imagePath,
    required this.app,
  });

  final String app;

  @override
  Widget build(BuildContext context) {
    // bool exists = false;
    // FirebaseFirestore.instance
    //     .collection("SalikAppUsers")
    //     .doc(FirebaseAuth.instance.currentUser!.email)
    //     .get()
    //     .then((snapshot) {
    //   if (snapshot.exists) {
    //     exists = true;
    //   } else {
    //     exists = false;
    //   }
    // });

    // onTap() {
    //   if (exists) {
    //     if (app == "salik") {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) {
    //             //return const SalikScreen();
    //           },
    //         ),
    //       );
    //     } else if (app == "darb") {
    //       return () {};
    //     }
    //   }
    // }

    return GestureDetector(
      onTap: () {
        //onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage(imagePath),
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }
}
