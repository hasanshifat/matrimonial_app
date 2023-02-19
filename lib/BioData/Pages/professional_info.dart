import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Constants/strings.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class ProfessionalInfoPage extends StatefulWidget {
  const ProfessionalInfoPage({super.key});

  @override
  State<ProfessionalInfoPage> createState() => _ProfessionalInfoPageState();
}

class _ProfessionalInfoPageState extends State<ProfessionalInfoPage> {
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

  String hintText = 'নির্বাচন করুন';
  String? selectedProfession;
  TextEditingController professionDetails = TextEditingController();
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
              fieldLabel("পেশা"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedProfession,
                    onChanged: (v) {
                      setState(() {
                        selectedProfession = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.prefessions),
              ),
              OtherUtils.height10,
              fieldLabel("পেশার বিস্তারিত বিবরণ"),
              CustomTextField(
                controller: professionDetails,
                hintText: "",
                maxLength: 400,
                maxLines: 5,
              ),
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
