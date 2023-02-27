import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBars {
  void showSnackBar(BuildContext context, String text, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
        content: Text(
          text,
          style: GoogleFonts.anekBangla(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  static showSnackBarOnly(context, String text, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
        content: Text(
          text,
          style: GoogleFonts.anekBangla(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  static snackBarDone(context, String text, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
        content: Text(
          text,
          style: GoogleFonts.anekBangla(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  void snackBarWithContent(
      BuildContext context, Color backgroundColor, Widget content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
        content: content,
      ),
    );
  }
}
