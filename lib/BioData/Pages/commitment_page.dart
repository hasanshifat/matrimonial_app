import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class CommitmentPage extends StatefulWidget {
  const CommitmentPage({super.key});

  @override
  State<CommitmentPage> createState() => _CommitmentPageState();
}

class _CommitmentPageState extends State<CommitmentPage> {
  Size? pageSize;
  String hintText = 'নির্বাচন করুন';
  String? parentAgreedOrNot;
  String? trueOrFalse;
  String? canTakeAction;
  Widget fieldLabel(String label) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            // style: GoogleFonts.anekBangla(
            //     color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
            style: const TextTheme().bodyMedium,
          ),
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
              fieldLabel(
                  "example.com অ্যাপ এ বায়োডাটা জমা দিচ্ছেন, তা আপনার অভিভাবক জানেন?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: parentAgreedOrNot,
                    onChanged: (v) {
                      setState(() {
                        parentAgreedOrNot = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['হ্যাঁ', 'না']),
              ),
              OtherUtils.height10,
              fieldLabel(
                  "আল্লাহ'র শপথ করে সাক্ষ্য দিন, যে তথ্যগুলো দিয়েছেন সব সত্য?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: trueOrFalse,
                    onChanged: (v) {
                      setState(() {
                        trueOrFalse = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['হ্যাঁ', 'না']),
              ),
              OtherUtils.height10,
              fieldLabel(
                  "কোনো মিথ্যা তথ্য প্রদান করলে দুনিয়াবী আইনগত এবং আখিরাতের দায়ভার example.com কর্তৃপক্ষ নিবে না। আপনি কি সম্মত?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: canTakeAction,
                    onChanged: (v) {
                      setState(() {
                        canTakeAction = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['হ্যাঁ', 'না']),
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
