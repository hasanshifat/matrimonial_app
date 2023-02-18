import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Constants/strings.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class FamilyInfo extends StatefulWidget {
  const FamilyInfo({super.key});

  @override
  State<FamilyInfo> createState() => _FamilyInfoState();
}

class _FamilyInfoState extends State<FamilyInfo> {
  String hintText = 'নির্বাচন করুন';

  String? isFatherAlive;
  String? isMotherAlive;
  String? selectedBrothersNum;
  String? selectedSistersNum;
  String? selectedEconomicStatus;

  TextEditingController fathersOccupation = TextEditingController();
  TextEditingController mothersOccupation = TextEditingController();
  TextEditingController brothersOccupation = TextEditingController();
  TextEditingController sistersOccupation = TextEditingController();
  TextEditingController unclesOccupation = TextEditingController();
  TextEditingController economicDescription = TextEditingController();
  TextEditingController islamicDescription = TextEditingController();
  Widget fieldLabel(String label) {
    return Row(
      children: [
        Text(
          label,
          // style: GoogleFonts.anekBangla(
          //     color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          style: const TextTheme().bodyMedium,
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          children: const [
            Icon(
              Icons.star,
              color: Colors.redAccent,
              size: 12,
            ),
            SizedBox(
              height: 14,
            )
          ],
        ),
      ],
    );
  }

  Widget dropDown(List<String> list, String? selected) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5)),
        child: DropdownButton<String>(
          isExpanded: true,
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          hint: Text(
            hintText,
            style: GoogleFonts.anekBangla(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            // style: const TextStyle(
            //     color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.

            setState(() {
              selected = value!;

              // ss(selected);
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextTheme().bodyMedium,
                // style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldLabel("আপনার পিতা কি জীবিত?"),
              dropDown(['জী, জীবিত', 'না, মৃত'], isFatherAlive),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("পিতার পেশার বিবরণ"),
              CustomTextField(
                controller: fathersOccupation,
                hintText: "",
                maxLines: 3,
                maxLength: 300,
              ),
              Text(
                "চাকরীজীবি হলে প্রতিষ্ঠানের ধরণ এবং পদবী, আর ব্যবসায়ী হলে কী ধরণের ব্যবসা করেন/করতেন ইত্যাদি বিস্তারিত লিখবেন।",
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("আপনার মাতা কি জীবিত?"),
              dropDown(['জী, জীবিত', 'না, মৃত'], isMotherAlive),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("মাতার পেশার বিবরণ"),
              CustomTextField(
                controller: mothersOccupation,
                hintText: "",
                maxLines: 3,
                maxLength: 300,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              fieldLabel("আপনার কতজন ভাই আছে?"),
              dropDown(['নেই', '১', '২', '৩', '8', '৫'], selectedBrothersNum),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("ভাইদের তথ্য"),
              CustomTextField(
                controller: brothersOccupation,
                hintText: "",
                maxLength: 300,
                maxLines: 3,
              ),
              Text(
                "শিক্ষাগত যোগ্যতা, বৈবাহিক অবস্থা এবং পেশা লিখবেন। একাধিক ভাই থাকলে কমা দিয়ে নিচের লাইনে লিখবেন।",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("আপনার কতজন বোন আছে?"),
              dropDown(['নেই', '১', '২', '৩', '8', '৫'], selectedSistersNum),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("বোনদের তথ্য"),
              CustomTextField(
                controller: sistersOccupation,
                hintText: "",
                maxLines: 3,
                maxLength: 300,
              ),
              Text(
                "শিক্ষাগত যোগ্যতা, বৈবাহিক অবস্থা এবং পেশা লিখবেন। একাধিক ভাই থাকলে কমা দিয়ে নিচের লাইনে লিখবেন।",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "চাচা মামাদের পেশা",
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextField(
                controller: unclesOccupation,
                hintText: "",
                maxLines: 3,
                maxLength: 300,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              fieldLabel("পারিবারিক অর্থনৈতিক অবস্থা"),
              dropDown(AppConstants.economicStatus, selectedEconomicStatus),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("অর্থনৈতিক অবস্থার বর্ণনা"),
              CustomTextField(
                controller: economicDescription,
                hintText: "",
                maxLength: 300,
                maxLines: 3,
              ),
              fieldLabel("পারিবারিক দ্বীনি পরিবেশ কেমন?"),
              CustomTextField(
                controller: islamicDescription,
                hintText: "",
                maxLength: 300,
                maxLines: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubmitButton(
                      elevation: 2,
                      borderColor: Colors.transparent,
                      gradColor1: ColorCodes.deepGrey.withOpacity(0.5),
                      gradColor2: ColorCodes.deepGrey.withOpacity(0.5),
                      borderWidth: 0,
                      text: "বাদ দিন",
                      buttonRadius: 8,
                      height: 40,
                      width: 140,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      textSize: 14,
                      press: (() => {})),
                  SubmitButton(
                      elevation: 2,
                      borderColor: Colors.transparent,
                      gradColor1: ColorCodes.purpleBlue,
                      gradColor2: ColorCodes.purpleBlue,
                      borderWidth: 0,
                      text: "সেভ করুন",
                      buttonRadius: 8,
                      height: 40,
                      width: 140,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      textSize: 14,
                      press: (() => {})),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
