import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Common UI/custom_drop_down.dart';
import '../../Common UI/submit_button.dart';
import '../../Constants/strings.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/other_utils.dart';

class GeneralInfoPage extends StatefulWidget {
  const GeneralInfoPage({super.key});

  @override
  State<GeneralInfoPage> createState() => _GeneralInfoPageState();
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
  String? selectedBioDataType;
  String? selectedMaritialStatus;
  String? selectedWeight;
  String? selectedHeight;
  String? selectedBodyColor;
  String? selectedBloodgroup;
  String? selectedNationality;
  String hintText = 'নির্বাচন করুন';
  TextEditingController birthDate = TextEditingController();
  Size? pageSize;
  DateTime selectedDate = DateTime.now();
  String? formattedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

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
              fieldLabel("বায়োডাটার ধরন"),
              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedBioDataType,
                    onChanged: (val) {
                      setState(() {
                        selectedBioDataType = val.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.bioDataType),
              ),

              OtherUtils.height10,
              fieldLabel("বৈবাহিক অবস্থা"),
              // dropDown(AppConstants.maritialStatus, selectedMaritialStatus),
              SizedBox(
                  width: double.infinity,
                  child: CustomDropDownBtn(
                      selectedID: selectedMaritialStatus,
                      onChanged: (value) {
                        setState(() {
                          selectedMaritialStatus = value.toString();
                        });
                      },
                      onTap: () {},
                      hint: hintText,
                      items: AppConstants.maritialStatus)),
              OtherUtils.height10,
              fieldLabel("জন্মসন"),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate == null
                            ? "যেমন: 11-11-1997"
                            : formattedDate!,
                        style: const TextTheme().bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: ColorCodes.primaryPink,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              fieldLabel("উচ্চতা"),

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedHeight,
                    onChanged: (v) {
                      setState(() {
                        selectedHeight = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.height),
              ),
              OtherUtils.height10,
              fieldLabel("গাত্রবর্ণ"),

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedBodyColor,
                    onChanged: (v) {
                      setState(() {
                        selectedBodyColor = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.bodyColor),
              ),
              OtherUtils.height10,
              fieldLabel("ওজন"),

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedWeight,
                    onChanged: (v) {
                      setState(() {
                        selectedWeight = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.weight),
              ),
              OtherUtils.height10,
              fieldLabel("রক্তের গ্রুপ"),

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedBloodgroup,
                    onChanged: (v) {
                      setState(() {
                        selectedBloodgroup = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.bloodGroup),
              ),
              OtherUtils.height10,
              fieldLabel("জাতীয়তা"),

              SizedBox(
                width: double.infinity,
                child: CustomDropDownBtn(
                    selectedID: selectedNationality,
                    onChanged: (v) {
                      setState(() {
                        selectedNationality = v.toString();
                      });
                    },
                    onTap: () {},
                    hint: hintText,
                    items: AppConstants.nationality),
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
