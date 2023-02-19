import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/color_codes.dart';

class CustomDropDownBtn extends StatefulWidget {
  final String hint;
  final List<String>? items;
  final String? selectedID;
  final Function(Object?)? onChanged;
  final Function()? onTap;
  const CustomDropDownBtn(
      {super.key,
      required this.selectedID,
      required this.onChanged,
      required this.onTap,
      required this.hint,
      required this.items});

  @override
  State<CustomDropDownBtn> createState() => _CustomDropDownBtnState();
}

class _CustomDropDownBtnState extends State<CustomDropDownBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(10),
            hint: Text(widget.hint,
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: widget.selectedID,
            onChanged: widget.onChanged,
            items: widget.items!.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: GoogleFonts.anekBangla(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  // style: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
