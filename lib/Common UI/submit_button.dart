import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Utils/color_codes.dart';

class SubmitButton extends StatelessWidget {
  final String? text;
  final Function()? press;
  final Color? color,gradColor1,gradColor2;
  final Color? borderColor;
  final Color? textColor;
  final double? textSize, width, height, elevation, buttonRadius, borderWidth;
  final FontWeight? fontWeight;

  const SubmitButton(
      {Key? key,
      this.text,
      required this.press,
      this.color,
      this.gradColor1=Colors.white,
      this.gradColor2=Colors.white,
      this.borderColor = Colors.transparent,
      this.textColor = Colors.white,
      this.width = double.infinity,
      this.elevation,
      this.fontWeight,
      this.borderWidth,
      this.buttonRadius = 50,
      this.height = 40,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: press,
        child: Material(
          elevation: elevation!,
          borderRadius: BorderRadius.circular(buttonRadius!),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: borderColor!, width: borderWidth!),
              gradient:  LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  gradColor1!,
                  gradColor2!
                  // ColorCodes.seconderyStrongPink,
                  // ColorCodes.primaryPink,
                ],
                stops: [0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(buttonRadius!),
            ),
            child: Center(
              child: Text(
                "$text",
                style: GoogleFonts.anekBangla(
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: fontWeight),
              ),
            ),
          ),
        ));
  }
}
