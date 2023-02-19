import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Constants/strings.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
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

  TextEditingController clothOutsideHome = TextEditingController();
  TextEditingController niqab = TextEditingController();
  TextEditingController prayerDetails = TextEditingController();
  TextEditingController prayerQaza = TextEditingController();
  TextEditingController marhamNonmarham = TextEditingController();
  TextEditingController reciteQuran = TextEditingController();
  TextEditingController musicListen = TextEditingController();
  TextEditingController mentalIllness = TextEditingController();
  TextEditingController aboutYourself = TextEditingController();
  TextEditingController bearedDetails = TextEditingController();
  String? selectedFiqh;
  String hintText = 'নির্বাচন করুন';
  Size? pageSize;
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
              fieldLabel("ঘরের বাহিরে সাধারণত কি ধরণের পোষাক পরেন?"),
              CustomTextField(
                controller: clothOutsideHome,
                hintText: "",
                maxLength: 100,
              ),
              Text(
                "পাত্রীর ক্ষেত্রে বোরকা, হিজাব, নিকাব এবং হাত-পা মোজা পরেন কি না অবশ্যই উল্লেখ করবেন।",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextTheme().bodyMedium,
              ),
              OtherUtils.height10,
              fieldLabel("কবে থেকে নিকাব সহ পর্দা করছেন?"),
              CustomTextField(
                controller: niqab,
                hintText: "",
                maxLength: 200,
              ),
              fieldLabel("সুন্নতি দাড়ি আছে কি না? কবে থেকে রেখেছেন?"),
              CustomTextField(
                controller: bearedDetails,
                hintText: "",
                maxLength: 100,
              ),
              Text(
                "\"হ্যাঁ\" অথবা \"না\" দিয়ে স্পষ্ট করে উত্তর লিখুন।",
                style: const TextTheme().bodyMedium,
              ),
              OtherUtils.height10,
              fieldLabel("প্রতিদিন পাঁচ ওয়াক্ত নামাজ পড়েন? কবে থেকে পড়ছেন?"),
              CustomTextField(
                controller: prayerDetails,
                hintText: "",
                maxLength: 300,
              ),
              Text(
                "\"হ্যাঁ\" অথবা \"না\" দিয়ে স্পষ্ট করে উত্তর লিখুন।",
                style: const TextTheme().bodyMedium,
              ),
              OtherUtils.height10,
              fieldLabel("সাধারণত সপ্তাহে কত ওয়াক্ত নামায আপনার কাযা হয়?"),
              CustomTextField(
                controller: prayerQaza,
                hintText: "",
                maxLength: 2,
              ),
              fieldLabel("মাহরাম/নন-মাহরাম মেনে চলেন কি?"),
              CustomTextField(
                controller: marhamNonmarham,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("শুদ্ধভাবে কুরআন তিলওয়াত করতে পারেন?"),
              CustomTextField(
                controller: reciteQuran,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("কোন ফিকহ অনুসরণ করেন?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedFiqh,
                    onChanged: (v) {
                      setState(() {
                        selectedFiqh = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.fiqh),
              ),
              OtherUtils.height10,
              fieldLabel("নাটক / সিনেমা / সিরিয়াল / গান এসব দেখেন বা শুনেন?"),
              CustomTextField(
                controller: musicListen,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("আপনার মানসিক বা শারীরিক কোনো রোগ আছে?"),
              CustomTextField(
                controller: mentalIllness,
                hintText: "",
                maxLength: 200,
              ),
              fieldLabel("নিজের সম্পর্কে কিছু লিখুন"),
              CustomTextField(
                controller: aboutYourself,
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
