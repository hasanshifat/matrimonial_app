import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Constants/strings.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/custom_text_form_field.dart';
import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class EducationalInfoPage extends StatefulWidget {
  const EducationalInfoPage({super.key});

  @override
  State<EducationalInfoPage> createState() => _EducationalInfoPageState();
}

class _EducationalInfoPageState extends State<EducationalInfoPage> {
  String hintText = 'নির্বাচন করুন';
  TextEditingController sscDakhilSomomanController = TextEditingController();
  TextEditingController hscAlimSomomanController = TextEditingController();
  TextEditingController hounsFazilSomomanController = TextEditingController();
  TextEditingController instituteName = TextEditingController();
  TextEditingController graduationYear = TextEditingController();
  TextEditingController graduationRuningYear = TextEditingController();
  TextEditingController postGraduationDept = TextEditingController();
  TextEditingController postGraduationDeptInstitute = TextEditingController();
  TextEditingController postGraduationYear = TextEditingController();
  TextEditingController postGraduationResult = TextEditingController();
  TextEditingController postGraduationRuningYear = TextEditingController();
  TextEditingController phdSubject = TextEditingController();
  TextEditingController phdInstitute = TextEditingController();
  TextEditingController phdYear = TextEditingController();
  TextEditingController otherEducation = TextEditingController();
  TextEditingController islamicEducationTitle = TextEditingController();
  TextEditingController schoolName = TextEditingController();
  TextEditingController hscCollegeName = TextEditingController();
  TextEditingController dipCollegeName = TextEditingController();
  TextEditingController graduationResult = TextEditingController();

  String? selectedEducationDeptSsc;
  String? selectedEducationDeptHsc;
  String? selectedEducationDeptDiploma;
  String? selectedSscResult;
  String? selectedHscResult;
  String? selectedDiplomaResult;
  String? selectHscOrDeploma;
  String? selectedEducation;
  String? selectedGeneralEducationHeighestDegree;
  Size? pageSize;
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
              fieldLabel("আপনার শিক্ষা মাধ্যম"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedEducation,
                    onChanged: (v) {
                      setState(() {
                        selectedEducation = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.educationType),
              ),
              OtherUtils.height10,
              fieldLabel("সর্বোচ্চ শিক্ষাগত যোগ্যতা"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedGeneralEducationHeighestDegree,
                    onChanged: (v) {
                      setState(() {
                        selectedGeneralEducationHeighestDegree = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.generalEduHstDgr),
              ),
              OtherUtils.height10,
              fieldLabel("এস.এস.সি / দাখিল / সমমান পাসের সন"),
              CustomTextField(
                controller: sscDakhilSomomanController,
                hintText: "2012",
                maxLength: 4,
              ),
              fieldLabel("বিভাগ"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedEducationDeptSsc,
                    onChanged: (v) {
                      setState(() {
                        selectedEducationDeptSsc = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.educationDept),
              ),
              OtherUtils.height10,
              fieldLabel("ফলাফল"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedSscResult,
                    onChanged: (v) {
                      setState(() {
                        selectedSscResult = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.sscResult),
              ),
              OtherUtils.height10,
              fieldLabel("স্কুল/মাদ্রাসা নাম"),
              CustomTextField(
                controller: schoolName,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("SSC পরে কোন মাধ্যমে পড়াশুনা করেছেন?"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectHscOrDeploma,
                    onChanged: (v) {
                      setState(() {
                        selectHscOrDeploma = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: const ['HSC', 'ডিপ্লোমা']),
              ),
              OtherUtils.height10,
              fieldLabel("এইচ.এস.সি / আলিম / সমমান পাসের সন"),
              CustomTextField(
                controller: hscAlimSomomanController,
                hintText: '2014',
                maxLength: 4,
              ),
              fieldLabel("বিভাগ"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedEducationDeptHsc,
                    onChanged: (v) {
                      setState(() {
                        selectedEducationDeptHsc = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.educationDept),
              ),
              OtherUtils.height10,
              fieldLabel("ফলাফল"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedHscResult,
                    onChanged: (v) {
                      setState(() {
                        selectedHscResult = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.sscResult),
              ),
              OtherUtils.height10,
              fieldLabel("কলেজ/মাদ্রাসা নাম"),
              CustomTextField(controller: hscCollegeName, hintText: ""),
              OtherUtils.height10,
              fieldLabel("ডিপ্লোমা পাসের সন"),
              CustomTextField(
                controller: sscDakhilSomomanController,
                hintText: "2012",
                maxLength: 4,
              ),
              fieldLabel("বিভাগ"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedEducationDeptDiploma,
                    onChanged: (v) {
                      setState(() {
                        selectedEducationDeptDiploma = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.educationDept),
              ),
              OtherUtils.height10,
              fieldLabel("ফলাফল"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedDiplomaResult,
                    onChanged: (v) {
                      setState(() {
                        selectedDiplomaResult = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.sscResult),
              ),
              OtherUtils.height10,
              fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম"),
              CustomTextField(
                controller: dipCollegeName,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("স্নাতক / স্নাতক (সম্মান) / ফাজিল পড়াশোনার বিষয়"),
              CustomTextField(
                controller: hounsFazilSomomanController,
                hintText: "কম্পিউটার বিজ্ঞান ও প্রকৌশল",
                maxLength: 40,
              ),
              fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম "),
              CustomTextField(
                controller: instituteName,
                hintText: "বাংলাদেশ প্রকৌশল বিশ্ববিদ্যালয়",
                maxLength: 100,
              ),
              fieldLabel("চলমান সন"),
              CustomTextField(
                controller: graduationRuningYear,
                hintText: "2017",
                maxLength: 4,
              ),
              fieldLabel("পাসের সন"),
              CustomTextField(
                controller: graduationYear,
                hintText: "2018",
                maxLength: 4,
              ),
              fieldLabel("ফলাফল"),
              CustomTextField(
                controller: graduationResult,
                hintText: "",
                maxLength: 4,
              ),
              fieldLabel("স্নাতকোত্তর / কামিল পড়াশোনার বিষয়"),
              CustomTextField(
                controller: postGraduationDept,
                hintText: "এমএসসি ইন টেক্সটাইল ইঞ্জিনিয়ারিং",
                maxLength: 200,
              ),
              fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম"),
              CustomTextField(
                controller: postGraduationDeptInstitute,
                hintText: "বাংলাদেশ টেক্সটাইল বিশ্ববিদ্যালয়",
                maxLength: 200,
              ),
              fieldLabel("চলমান সন"),
              CustomTextField(
                controller: postGraduationRuningYear,
                hintText: "2019",
                maxLength: 4,
              ),
              fieldLabel("পাসের সন"),
              CustomTextField(
                controller: postGraduationYear,
                hintText: "2020",
                maxLength: 4,
              ),
              fieldLabel("ফলাফল"),
              CustomTextField(
                controller: postGraduationResult,
                hintText: "",
                maxLength: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("ডক্টরেট অধ্যয়নের বিষয়"),
              CustomTextField(
                controller: phdSubject,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম"),
              CustomTextField(
                controller: phdInstitute,
                hintText: "",
                maxLength: 100,
              ),
              fieldLabel("পাসের সন"),
              CustomTextField(
                controller: phdYear,
                hintText: "",
                maxLength: 100,
              ),
              Text(
                "অন্যান্য শিক্ষাগত যোগ্যতা",
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextField(
                controller: otherEducation,
                hintText: "",
                maxLength: 200,
                maxLines: 5,
              ),
              Text(
                "শিক্ষাপ্রতিষ্ঠানের নাম, বিষয়, পাসের সন সহ বিস্তারিত লিখবেন। কিছু না থাকলে ঘরটি ফাঁকা রাখবেন।",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "দ্বীনি শিক্ষাগত পদবী সমূহ",
                style: const TextTheme().bodyMedium,
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextField(
                controller: islamicEducationTitle,
                hintText: "",
                maxLength: 100,
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
