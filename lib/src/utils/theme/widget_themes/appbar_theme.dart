import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khat_application/src/constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: tPrimaryColor,
    titleTextStyle: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 24, fontWeight: FontWeight.w600),
    centerTitle: true,
    iconTheme: const IconThemeData(color: tWhiteColor, size: 25, weight: 0.2),
  );

  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: tSecondaryColor,
    titleTextStyle: GoogleFonts.poppins(
        color: tWhiteColor, fontSize: 24, fontWeight: FontWeight.w600),
    centerTitle: true,
    iconTheme: const IconThemeData(color: tWhiteColor, size: 20, weight: 0.3),
  );
}
