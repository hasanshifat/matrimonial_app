import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  Size? pageSize;
  String hintText = 'নির্বাচন করুন';
  TextEditingController gurdianName = TextEditingController();
  TextEditingController gurdianMobileNo = TextEditingController();
  TextEditingController gurdianEmail = TextEditingController();
  TextEditingController relationWithGurdian = TextEditingController();

  Widget fieldLabel(String label) {
    return Row(
      children: [
        Text(
          label,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
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
              fieldLabel("অভিভাবকের নাম"),
              CustomTextField(
                controller: gurdianName,
                hintText: "পূর্ণ নাম লিখুন",
                maxLength: 60,
              ),
              fieldLabel("অভিভাবকের সাথে সম্পর্ক"), //db te nai
              CustomTextField(
                controller: relationWithGurdian,
                hintText: "যেমন: বাবা",
                maxLength: 40,
              ),
              fieldLabel("অভিভাবকের মোবাইল নাম্বার"),
              CustomTextField(
                controller: gurdianMobileNo,
                hintText: "",
                maxLength: 11,
                keyboardType: TextInputType.phone,
              ),
              fieldLabel("বায়োডাটা গ্রহণের ই-মেইল"),
              CustomTextField(
                controller: gurdianEmail,
                hintText: "",
                maxLength: 60,
                keyboardType: TextInputType.emailAddress,
              ),
              OtherUtils.height10,
              OtherUtils.height10,
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
