import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        fontSize: 28, fontWeight: FontWeight.w800, color: tDarkColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w700, color: tDarkColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: tDarkColor),
    bodyLarge: GoogleFonts.poppins(color: tDarkColor, fontSize: 18),
    bodyMedium: GoogleFonts.poppins(color: tDarkColor, fontSize: 16),
    bodySmall: GoogleFonts.poppins(color: tDarkColor, fontSize: 14),
    labelSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w600, fontSize: 14, color: tGreyColor),
    labelMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600, fontSize: 16, color: tGreyColor),
    displayMedium: GoogleFonts.poppins(
        color: tDarkColor, fontSize: 20, fontWeight: FontWeight.bold),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
        fontSize: 28, fontWeight: FontWeight.w800, color: tWhiteColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w700, color: tWhiteColor),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 16, fontWeight: FontWeight.w600, color: tWhiteColor),
    bodyLarge: GoogleFonts.poppins(color: tWhiteColor, fontSize: 18),
    bodyMedium: GoogleFonts.poppins(color: tWhiteColor, fontSize: 16),
    bodySmall: GoogleFonts.poppins(color: tWhiteColor, fontSize: 14),
    labelSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
  );
}
