import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class MarriageInfoPage extends StatefulWidget {
  const MarriageInfoPage({super.key});

  @override
  State<MarriageInfoPage> createState() => _MarriageInfoPageState();
}

class _MarriageInfoPageState extends State<MarriageInfoPage> {
  String hintText = 'নির্বাচন করুন';
  Size? pageSize;
  String? selectedGurdianOppinion;
  String? selectedJobOppinion;
  String? selectedEducationOppinion;
  TextEditingController marriageReason = TextEditingController();
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
              color: ColorCodes.deepRed,
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
              fieldLabel("অভিভাবক আপনার বিয়েতে রাজি কি না?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedGurdianOppinion,
                    onChanged: (v) {
                      setState(() {
                        selectedGurdianOppinion = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['জী', 'না']),
              ),
              OtherUtils.height10,
              fieldLabel("বিয়ের পর স্ত্রীকে চাকরী করতে দিতে চান?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedJobOppinion,
                    onChanged: (v) {
                      setState(() {
                        selectedJobOppinion = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['জী', 'না']),
              ),
              OtherUtils.height10,
              fieldLabel("বিয়ের পর স্ত্রীকে পড়াশোনা করতে দিতে চান?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedEducationOppinion,
                    onChanged: (v) {
                      setState(() {
                        selectedEducationOppinion = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['জী', 'না']),
              ),
              OtherUtils.height10,
              Text(
                "বিয়ের কারণ",
                style: const TextTheme().bodyMedium,
              ),
              CustomTextField(
                controller: marriageReason,
                hintText: "",
                maxLength: 500,
                maxLines: 4,
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
