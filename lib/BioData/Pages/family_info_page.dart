import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Constants/strings.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/other_utils.dart';

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
  Size? pageSize;
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

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldLabel("আপনার পিতা কি জীবিত?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: isFatherAlive,
                    onChanged: (value) {
                      setState(() {
                        isFatherAlive = value.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['জী, জীবিত', 'না, মৃত']),
              ),

              OtherUtils.height10,
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
              OtherUtils.height10,
              fieldLabel("আপনার মাতা কি জীবিত?"),

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: isMotherAlive,
                    onChanged: (value) {
                      setState(() {
                        isMotherAlive = value.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['জী, জীবিত', 'না, মৃত']),
              ),
              OtherUtils.height10,
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

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedBrothersNum,
                    onChanged: (value) {
                      setState(() {
                        selectedBrothersNum = value.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['নেই', '১', '২', '৩', '8', '৫']),
              ),
              OtherUtils.height10,
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
              // dropDown(['নেই', '১', '২', '৩', '8', '৫'], selectedSistersNum),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedSistersNum,
                    onChanged: (value) {
                      setState(() {
                        selectedSistersNum = value.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['নেই', '১', '২', '৩', '8', '৫']),
              ),

              OtherUtils.height10,
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
              OtherUtils.height10,
              Text(
                "চাচা মামাদের পেশা",
                style: const TextTheme().bodyMedium,
              ),
              OtherUtils.height5,
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
              // dropDown(AppConstants.economicStatus, selectedEconomicStatus),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedEconomicStatus,
                    onChanged: (value) {
                      setState(() {
                        selectedEconomicStatus = value.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.economicStatus),
              ),
              OtherUtils.height10,
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
              OtherUtils.height10,
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
                      width: pageSize!.width * 0.45,
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
                      width: pageSize!.width * 0.45,
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
