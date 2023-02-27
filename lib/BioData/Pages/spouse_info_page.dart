import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Constants/strings.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class SpouseInfoPage extends StatefulWidget {
  const SpouseInfoPage({super.key});

  @override
  State<SpouseInfoPage> createState() => _SpouseInfoPageState();
}

class _SpouseInfoPageState extends State<SpouseInfoPage> {
  String hintText = 'নির্বাচন করুন';
  Size? pageSize;
  String? selectedNationality;
  List<String> selectedMaritialStatus = [];
  List<String> selectedProfessions = [];
  List<String> selectedEconomicStatus = [];
  List<String> selectedDivison = [];

  List<int> selectedIndexListOfBodyColor = [];
  List<int> selectedIndexListOfMaritialStatus = [];
  List<int> selectedIndexListOfProfessions = [];
  List<int> selectedIndexListOfEconomicStatus = [];
  List<int> selectedIndexListOfDivison = [];
  List<String> selectedBodyColors = [];
  onSelected(int index, List<int> selectedIndexList) {
    setState(() => selectedIndexList.add(index));
  }

  onRemove(int index, List<int> selectedIndexList) {
    setState(() => selectedIndexList.remove(index));
  }

  TextEditingController age = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController aboutSpouse = TextEditingController();

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
              fieldLabel("বয়স"),
              CustomTextField(
                controller: age,
                hintText: "যেমন: ২৫-৩০ বছর",
                maxLength: 10,
              ),
              fieldLabel("উচ্চতা"),
              CustomTextField(
                controller: height,
                hintText: "যেমন: ৫'১\"-৫'১০\"",
                maxLength: 16,
              ),
              fieldLabel("ওজন"),
              CustomTextField(
                controller: weight,
                hintText: "যেমন: ৬০-৭০",
                maxLength: 16,
              ),
              fieldLabel("গাত্রবর্ণ"),
              multiSelect(AppConstants.bodyColor, selectedBodyColors,
                  selectedIndexListOfBodyColor),
              OtherUtils.height5,
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
              OtherUtils.height10,
              fieldLabel("বৈবাহিক অবস্থা"),
              multiSelect(AppConstants.maritialStatus, selectedMaritialStatus,
                  selectedIndexListOfMaritialStatus),
              OtherUtils.height5,
              fieldLabel("পেশা"),
              multiSelect(AppConstants.prefessions, selectedProfessions,
                  selectedIndexListOfProfessions),
              OtherUtils.height5,
              fieldLabel("অর্থনৈতিক অবস্থা"),
              multiSelect(AppConstants.economicStatus, selectedEconomicStatus,
                  selectedIndexListOfEconomicStatus),
              OtherUtils.height5,
              fieldLabel("বিভাগ"),
              multiSelect(AppConstants.divison, selectedDivison,
                  selectedIndexListOfDivison),
              OtherUtils.height5,
              fieldLabel("পতি বা পত্নী সম্পর্কে"),
              CustomTextField(
                controller: aboutSpouse,
                hintText: "",
                maxLength: 500,
                maxLines: 5,
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

  Widget multiSelect(List<String> list, List<String> selectedList,
      List<int> selectedIndexList) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            // selectedBodyColors.contains(AppConstants.bodyColor[index]);
            // onSelected(index);
            return GestureDetector(
              onTap: () {
                if (!selectedList.contains(list[index])) {
                  selectedList.add(list[index]);
                  onSelected(index, selectedIndexList);
                  print(selectedBodyColors.length);
                  setState(() {});
                } else {
                  selectedList.remove(list[index]);
                  onRemove(index, selectedIndexList);
                  print(selectedBodyColors.length);
                  setState(() {});
                }
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: selectedIndexList.contains(index)
                            ? ColorCodes.softGreen
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.5,
                            color: selectedIndexList.contains(index)
                                ? ColorCodes.deepGreen
                                : ColorCodes.deepGrey)),
                    child: Center(
                      child: Text(
                        list[index],
                        style: GoogleFonts.anekBangla(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: selectedIndexList.contains(index)
                                ? Colors.white
                                : ColorCodes.deepGrey),
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
