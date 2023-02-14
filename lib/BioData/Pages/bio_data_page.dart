import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/custom_text_form_field.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';
import 'package:matrimonial_app/Constants/strings.dart';

import '../../Homepage/Services/district_service.dart';
import '../../Homepage/model/district_model.dart';
import '../../Utils/color_codes.dart';

class BioDataPage extends StatefulWidget {
  static const String routeName = '/bioDataPage';
  const BioDataPage({super.key});

  @override
  State<BioDataPage> createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage>
    with TickerProviderStateMixin {
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
  bool isGeneralInfo = false;
  bool isSameAddress = false;

  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController divisonAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController zillaAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController upoZillaAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  // late AnimationController animationControllerReverse =
  //     AnimationController(vsync: this, duration: const Duration(seconds: 1))
  //       ..reverse();
  late Animation<double> animation = CurvedAnimation(
      parent: animationController, curve: Curves.easeInOutCubic);
  late Animation<double> divisonAnimation = CurvedAnimation(
      parent: divisonAnimationController, curve: Curves.easeInOutCubic);
  late Animation<double> zillaAnimation = CurvedAnimation(
      parent: zillaAnimationController, curve: Curves.easeInOutCubic);
  late Animation<double> upoZillaAnimation = CurvedAnimation(
      parent: upoZillaAnimationController, curve: Curves.easeInOutCubic);

  bool isButtonShow = true;
  bool isCountry = true;
  bool isDivision = false;
  bool isZilla = false;
  bool isUpoZilla = false;
  late List<DistrictModel> divDisThanaList;
  late List<String> divisonList;
  late List<String> districtList;
  late List<String> thanaList;
  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedThana;
  String? _selectedCountry;
  late List<String> countryList;

  @override
  void initState() {
    divisonList = [];
    districtList = [];
    thanaList = [];
    divDisThanaList = [];
    countryList = ['বাংলাদেশ'];
    getDistricNames();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    divisonAnimationController.dispose();
    zillaAnimationController.dispose();
    upoZillaAnimationController.dispose();

    super.dispose();
  }

  getDistricNames() async {
    var data = await DistricService.getDistricts();
    return setDistrictListModel(data);
  }

  setDistrictListModel(List<DistrictModel> list) {
    List div = [];

    setState(() {
      divDisThanaList = list;
      for (var element in divDisThanaList) {
        div.add(element.division.toString());
        List<String> divresult = LinkedHashSet<String>.from(div).toList();
        divisonList = divresult;
        // divisonList.insert(0, 'সকল');
      }
    });
  }

  setDistrictAsDivision() {
    List dis = [];
    List<String> divresult = [];
    setState(() {
      _selectedDistrict = null;
      _selectedThana = null;

      for (var element in divDisThanaList) {
        if (element.division == _selectedDivision) {
          dis.add(element.district.toString());
          divresult = LinkedHashSet<String>.from(dis).toList();
        }
        districtList = divresult;
      }
    });
  }

  setThanaAsDivisionNDistrict() {
    List dis = [];
    List<String> divresult = [];
    setState(() {
      _selectedThana = null;
      for (var element in divDisThanaList) {
        if (element.district == _selectedDistrict) {
          dis.add(element.upazila.toString());
          divresult = LinkedHashSet<String>.from(dis).toList();
        }
        thanaList = divresult;
      }
    });
  }

  Widget division() {
    return SizeTransition(
      sizeFactor: divisonAnimation,
      axis: Axis.vertical,
      axisAlignment: 0.0,
      child: Card(
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          divisonAnimationController.reverse();
                        });
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() {
                            isCountry = true;
                            animationController.forward();
                          });
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Text(
                      "একটি বিভাগ নির্বাচন করুন",
                      style: const TextTheme().bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  height: 0.8,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    itemCount: divisonList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            _selectedDivision = divisonList[index];
                            setDistrictAsDivision();

                            setState(() {
                              divisonAnimationController.reverse();
                            });
                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              setState(() {
                                isDivision = false;
                                isZilla = true;
                                zillaAnimationController.forward();
                              });
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                divisonList[index],
                                style: const TextTheme().bodyMedium,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget zilla() {
    return SizeTransition(
      sizeFactor: zillaAnimation,
      axis: Axis.vertical,
      axisAlignment: 0.0,
      child: Card(
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            zillaAnimationController.reverse();
                          });
                          Future.delayed(const Duration(milliseconds: 400), () {
                            setState(() {
                              isDivision = true;
                              divisonAnimationController.forward();
                            });
                          });
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      Text(
                        "একটি জেলা নির্বাচন করুন",
                        style: const TextTheme().bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 0.8,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      itemCount: districtList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              _selectedDistrict = districtList[index];
                              setThanaAsDivisionNDistrict();
                              setState(() {
                                zillaAnimationController.reverse();
                              });
                              Future.delayed(const Duration(milliseconds: 400),
                                  () {
                                setState(() {
                                  isZilla = false;
                                  isUpoZilla = true;
                                  upoZillaAnimationController.forward();
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  districtList[index],
                                  style: const TextTheme().bodyMedium,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget upoZilla() {
    return SizeTransition(
      sizeFactor: upoZillaAnimation,
      axis: Axis.vertical,
      axisAlignment: 0.0,
      child: Card(
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            upoZillaAnimationController.reverse();
                          });
                          Future.delayed(const Duration(milliseconds: 400), () {
                            setState(() {
                              isZilla = true;
                              zillaAnimationController.forward();
                            });
                          });
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      Text(
                        "একটি উপজেলা নির্বাচন করুন",
                        style: const TextTheme().bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 0.8,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      itemCount: thanaList.length,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              _selectedThana = thanaList[index];
                              setState(() {
                                upoZillaAnimationController.reverse();
                              });

                              Future.delayed(const Duration(milliseconds: 400),
                                  () {
                                setState(() {
                                  isUpoZilla = false;
                                  isButtonShow = true;
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  thanaList[index],
                                  style: const TextTheme().bodyMedium,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget country() {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      axisAlignment: 0.0,
      child: Card(
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "দেশ নির্বাচন করুন",
                      style: const TextTheme().bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          animationController.reverse();
                        });
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() {
                            isButtonShow = true;
                            print(isButtonShow);
                          });
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  height: 0.8,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      animationController.reverse();
                    });
                    Future.delayed(Duration(milliseconds: 400), () {
                      setState(() {
                        isCountry = false;
                        isDivision = true;
                        print(isCountry);
                        divisonAnimationController.forward();
                      });
                    });
                  },
                  child: ListView.builder(
                      itemCount: countryList.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              countryList[index],
                              style: const TextTheme().bodyMedium,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget graytext(String title) {
  //   return Text(
  //     title,
  //     style: const TextStyle(
  //         color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
  //   );
  // }

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
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5)),
        child: DropdownButton<String>(
          isExpanded: true,
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          hint: Text(
            hintText,
            style: GoogleFonts.anekBangla(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            // style: const TextStyle(
            //     color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
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
                style: GoogleFonts.anekBangla(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                // style: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  TextEditingController alakarNameController = TextEditingController();

  Widget textField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5)),
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
          child: address(),
        ),
      )),
    );
  }

  Widget address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "সাধারণ তথ্য",
          style: GoogleFonts.anekBangla(
              color: ColorCodes.primaryPink,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Next: ঠিকানা",
          style: const TextTheme().bodyMedium,
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        fieldLabel("স্থায়ী ঠিকানা"),
        Stack(
          children: [
            isCountry
                ? country()
                : isDivision
                    ? division()
                    : isZilla
                        ? zilla()
                        : isUpoZilla
                            ? upoZilla()
                            : const Text(""),
          ],
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isButtonShow = false;
              isCountry = true;
              animationController.forward();
            });
          },
          child: isButtonShow
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ColorCodes.deepGrey.withOpacity(0.5),
                          width: 0.5)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (_selectedDistrict == null ||
                                  _selectedDivision == null ||
                                  _selectedThana == null)
                              ? "ঠিকানা নির্বাচন করুন"
                              : _selectedDistrict == _selectedDivision
                                  ? "$_selectedThana, $_selectedDistrict"
                                  : "$_selectedThana, $_selectedDistrict, $_selectedDivision  ",
                          style: const TextTheme().bodyMedium,
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                )
              : const Text(''),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: alakarNameController,
          hintText: "এলাকার নাম লিখুন",
          maxLength: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "বাসার নাম্বার না লিখে শুধু এলাকার নাম লিখুন। যেমন- মিরপুর ১০, বাঘমারা।",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextTheme().bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        fieldLabel("বর্তমান ঠিকানা"),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSameAddress = !isSameAddress;
                });
              },
              child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: ColorCodes.deepGrey,
                    ),
                    color: isSameAddress == false
                        ? Colors.white
                        : ColorCodes.deepGrey,
                  ),
                  child: Center(
                    child: isSameAddress
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 14,
                          )
                        : const Text(""),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "স্থায়ী ও বর্তমান ঠিকানা একই",
              style: const TextTheme().bodyMedium,
            )
          ],
        )
      ],
    );
  }

  Widget generalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "সাধারণ তথ্য",
          style: GoogleFonts.anekBangla(
              color: ColorCodes.primaryPink,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Next: ঠিকানা",
          style: const TextTheme().bodyMedium,
        ),
        // graytext("Next: ঠিকানা"),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 0.5,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubmitButton(
                color: Colors.grey,
                elevation: 0,
                borderColor: Colors.transparent,
                borderWidth: 0,
                text: "Back",
                buttonRadius: 10,
                height: 50,
                width: 100,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
                textSize: 16,
                press: () {}),
            SubmitButton(
                elevation: 0,
                borderColor: Colors.transparent,
                borderWidth: 0,
                text: "Save & Next",
                buttonRadius: 10,
                height: 50,
                width: 100,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
                textSize: 16,
                press: () {}),
          ],
        )
        // SubmitButton(
        //   width: 100,
        //   press: () {},
        //   text: "Save & Next",
        //   textColor: Colors.white,
        //   color: Colors.purpleAccent,
        //   borderColor: Colors.transparent,
        // )
      ],
    );
  }
}
