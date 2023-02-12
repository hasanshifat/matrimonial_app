import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';
import 'package:matrimonial_app/Constants/strings.dart';

class BioDataPage extends StatefulWidget {
  static const String routeName = '/bioDataPage';
  const BioDataPage({super.key});

  @override
  State<BioDataPage> createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? selectedBioDataType;
  String? selectedMaritialStatus;
  String? selectedWeight;
  String? selectedHeight;
  String? selectedBodyColor;
  String? selectedBloodgroup;
  String? selectedNationality;

  String hintText = 'নির্বাচন করুন';
  String? selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget graytext(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Widget fieldLabel(String label) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
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

  String ss(String s) {
    return s.isEmpty ? s = '' : s;
  }

  Widget dropDown(List<String> list, selected) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black54,
          ),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          hint: Text(
            hintText,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.

            setState(() {
              selected = value!;
              // ss(selected);
              print(selected);
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget textField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "dd/mm/yyyy",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldLabel("বায়োডাটার ধরন"),
              dropDown(AppConstants.bioDataType, selectedBioDataType),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("বৈবাহিক অবস্থা"),
              dropDown(AppConstants.maritialStatus, selectedMaritialStatus),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("জন্মসন"),
              textField(),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("উচ্চতা"),
              dropDown(AppConstants.height, selectedHeight),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("গাত্রবর্ণ"),
              dropDown(AppConstants.bodyColor, selectedBodyColor),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("ওজন"),
              dropDown(AppConstants.weight, selectedWeight),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("রক্তের গ্রুপ"),
              dropDown(AppConstants.bloodGroup, selectedBloodgroup),
              const SizedBox(
                height: 10,
              ),
              fieldLabel("জাতীয়তা"),
              dropDown(AppConstants.nationality, selectedNationality),
              const SizedBox(
                height: 10,
              ),
              // SubmitButton(
              //   width: 100,
              //   press: () {},
              //   text: "Save & Next",
              //   textColor: Colors.white,
              //   color: Colors.purpleAccent,
              //   borderColor: Colors.transparent,
              // )
            ],
          ),
        ),
      )),
    );
  }
}
