import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';
import 'package:matrimonial_app/Homepage/Services/district_service.dart';
import 'package:matrimonial_app/Homepage/model/district_model.dart';
import 'package:matrimonial_app/Utils/color_codes.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../Short Listed/Pages/shortlist_details_page.dart';
import '../model/marraige_type.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String img = 'unfav';
  final searchController = TextEditingController();
  List<String> hobbiList = [
    'Reading',
    'Writing',
    'Singing',
    'Cooking',
    'Reding',
    'Wriing',
    'Sining',
    'Cookin'
  ];

  List<String>? selectedHobby = [];
  late List<String> occopationList;
  late List<String> selectedOccopationList;
  late List<MarraigeType> marraigeTypesList;
  late List<String> biodataType;
  late List<String> divisonList;
  late List<String> districtList;
  late List<String> thanaList;
  late List<String> countryList;
  late List<DistrictModel> divDisThanaList;
  String? _selectedMarraigeType;
  int? _selectedMarraigeTypeID;
  String? _selectedBiodataType;
  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedThana;
  String? _selectedCountry;
  SfRangeValues _valuesAge = const SfRangeValues(20.0, 30.0);
  SfRangeValues _valuesHeight = const SfRangeValues(4.0, 8.0);
  Size? pageSize;
  @override
  void initState() {
    divisonList = [];
    districtList = [];
    thanaList = [];
    divDisThanaList = [];
    selectedOccopationList = [];
    occopationList = [
      'শিক্ষার্থী',
      'শিক্ষক',
      'ইমাম',
      'প্রকৌশলী',
      'ডাক্তার',
      'ব্যবসায়ী',
      'অন্যান্য',
      'ফ্রিল্যান্সার',
      'সরকারী কর্মচারী',
      'বেসরকারি কর্মচারী',
    ];
    countryList = ['বাংলাদেশ'];
    biodataType = ['সকল', 'কনের বায়োডাটা', 'বরের বায়োডাটা'];
    marraigeTypesList = [
      MarraigeType(name: 'সকল', id: 101),
      MarraigeType(name: 'অবিবাহিত', id: 102),
      MarraigeType(name: 'বিবাহিত', id: 103),
      MarraigeType(name: 'তালাকপ্রাপ্ত', id: 104),
      MarraigeType(name: 'বিধবা', id: 105),
      MarraigeType(name: 'ডিভোর্সড', id: 106),
      MarraigeType(name: 'বিপত্নীক', id: 107)
    ];
    getDistricNames();
    super.initState();
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
        divisonList.insert(0, 'সকল');
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
          divresult.insert(0, 'সকল');
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
          divresult.insert(0, 'সকল');
        }
        thanaList = divresult;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          filterWidget(),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                contentWidget(context),
                contentWidget(context),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Padding contentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        // height: 450,
        // width: pageSize!.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => setState(() {
                  img = 'fav';
                }),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/$img.png',
                      height: 25, width: 25, color: ColorCodes.primaryPink),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: ColorCodes.primaryPurple.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Center(
                        child: Image.asset('assets/images/muslim.png',
                            color: ColorCodes.purpleBlue),
                      ),
                    ),
                  ),
                ),
                Text(
                  'MAF102',
                  style: GoogleFonts.anekBangla(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'শখ ও আগ্রহ',
                  style: GoogleFonts.anekBangla(
                      fontSize: 14,
                      color: ColorCodes.deepGrey,
                      fontWeight: FontWeight.w500),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: hobbiList
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Chip(
                                    backgroundColor: ColorCodes.primaryPurple
                                        .withOpacity(0.1),
                                    label: Text(
                                      e,
                                      style: GoogleFonts.anekBangla(
                                          fontSize: 12,
                                          color: ColorCodes.deepGrey,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ))
                          .toList()),
                ),
                const Divider(
                  thickness: 1,
                ),
                Table(
                  defaultColumnWidth: const IntrinsicColumnWidth(),
                  border: TableBorder(
                      horizontalInside: BorderSide(
                          width: 0.8,
                          color: Colors.grey.shade100,
                          style: BorderStyle.solid)),
                  children: [
                    // _tableRow('জন্ম সাল', '1996'),
                    _tableRow('বৈবাহিক অবস্থা', 'অবিবাহিত'),
                    _tableRow('জেলা', 'পাবনা'),
                    _tableRow('পেশা', 'প্রকৌশলী')
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SubmitButton(
                      elevation: 0,
                      borderColor: Colors.transparent,
                      gradColor1: ColorCodes.softGreen.withOpacity(0.5),
                      gradColor2: ColorCodes.softGreen.withOpacity(0.5),
                      borderWidth: 0,
                      text: "বিস্তারিত দেখুন",
                      buttonRadius: 8,
                      height: 30,
                      width: double.infinity,
                      fontWeight: FontWeight.w500,
                      textColor: ColorCodes.deepGrey,
                      textSize: 14,
                      press: (() {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          ShortListDetailsPage.routeName,
                          (route) => true,
                        );
                        // var content = Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     Text(
                        //       'আপনার অ্যাকাউন্ট নেই অথবা ',
                        //       style: GoogleFonts.anekBangla(
                        //           fontSize: 14,
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.w500),
                        //     ),
                        //     Text(
                        //       ' লগইন করুন',
                        //       style: GoogleFonts.anekBangla(
                        //           fontSize: 14,
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold,
                        //           decoration: TextDecoration.underline,
                        //           decorationColor:
                        //               ColorCodes.seconderyStrongPink,
                        //           decorationThickness: 2),
                        //     ),
                        //   ],
                        // );
                        // CustomSnackBars().snackBarWithContent(
                        //     context, ColorCodes.deepGreen, content);
                      })),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector filterWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          districtList.clear();
          thanaList.clear();
          _selectedMarraigeType = null;
          _selectedDivision = null;
          _selectedDistrict = null;
          _selectedThana = null;
        });

        filterDialog(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorCodes.deepGrey.withOpacity(0.05),
                // gradient: LinearGradient(
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                //   colors: [
                //     ColorCodes.purpleBlue.withOpacity(0.8),
                //     ColorCodes.purpleBlue,
                //   ],
                //   stops: const [0.5, 1.0],
                // ),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  const Icon(Icons.filter_list, color: ColorCodes.deepGrey),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ফিল্টার",
                    style: GoogleFonts.anekBangla(
                        fontWeight: FontWeight.w500,
                        color: ColorCodes.deepGrey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  filterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Dialog(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "ফিল্টার করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: ColorCodes.deepGrey),
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  Expanded(
                                      child: biodataTypeDropDown(
                                          context, setState)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: marraigeTypeDropDown(
                                          context, setState)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              //filterLocation()
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                      child:
                                          countryDropDown(context, setState)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: divisionTypeDropDown(
                                          context, setState)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  districtList.isEmpty
                                      ? const SizedBox()
                                      : Expanded(
                                          child: districtTypeDropDown(
                                              context, setState)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  thanaList.isEmpty
                                      ? const SizedBox()
                                      : Expanded(
                                          child: thanaTypeDropDown(
                                              context, setState))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "বয়স নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),
                              ageRangeWidget(setState),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "উচ্চতা নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),

                              heightRangeWidget(setState),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "শখ ও আগ্রহ নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              hobbiesFilterWidget(setState),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "পেশা নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              occopationFilterWidget(setState),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubmitButton(
                                elevation: 2,
                                borderColor: Colors.transparent,
                                gradColor1: ColorCodes.seconderyStrongPink,
                                gradColor2: ColorCodes.primaryPink,
                                borderWidth: 0,
                                text: "মুছে ফেলুন",
                                buttonRadius: 10,
                                height: 40,
                                width: pageSize!.width * 0.35,
                                fontWeight: FontWeight.w500,
                                textColor: Colors.white,
                                textSize: 16,
                                press: (() => {
                                      setState(() {
                                        districtList.clear();
                                        thanaList.clear();
                                        selectedHobby!.clear();
                                        selectedOccopationList.clear();
                                        _selectedMarraigeType = null;
                                        _selectedBiodataType = null;
                                        _selectedDivision = null;
                                        _selectedDistrict = null;
                                        _selectedThana = null;
                                        _selectedCountry = null;
                                        _valuesAge =
                                            const SfRangeValues(20.0, 30.0);
                                        _valuesHeight =
                                            const SfRangeValues(4.0, 8.0);
                                      })
                                    })),
                            SubmitButton(
                                elevation: 2,
                                borderColor: Colors.transparent,
                                gradColor1: ColorCodes.deepGreen,
                                gradColor2: ColorCodes.softGreen,
                                borderWidth: 0,
                                text: "খুজুন",
                                buttonRadius: 10,
                                height: 40,
                                width: pageSize!.width * 0.35,
                                fontWeight: FontWeight.w500,
                                textColor: Colors.white,
                                textSize: 16,
                                press: (() => {})),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ));
          });
        }));
  }

  Wrap hobbiesFilterWidget(StateSetter setState) {
    return Wrap(
      children: hobbiList.map(
        (hobby) {
          bool isSelected = false;
          if (selectedHobby!.contains(hobby)) {
            isSelected = true;
          }
          return GestureDetector(
            onTap: () {
              if (!selectedHobby!.contains(hobby)) {
                if (selectedHobby!.length < 10) {
                  selectedHobby!.add(hobby);
                  setState(() {});
                  print(selectedHobby);
                }
                // else {
                //   CustomSnackBars().showSnackBar(
                //       context,
                //       'সর্বোচ্চ ৫ টি নির্বাচন করতে পারেন',
                //       ColorCodes.seconderyStrongPink);

                //   print(selectedHobby);
                // }
              } else {
                selectedHobby!.removeWhere((element) => element == hobby);
                setState(() {});
                print(selectedHobby);
              }
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: isSelected ? ColorCodes.softGreen : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 0.5,
                          color: isSelected
                              ? ColorCodes.deepGreen
                              : ColorCodes.deepGrey)),
                  child: Text(
                    hobby,
                    style: GoogleFonts.anekBangla(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: isSelected ? Colors.white : ColorCodes.deepGrey),
                  ),
                )),
          );
        },
      ).toList(),
    );
  }

  SingleChildScrollView occopationFilterWidget(StateSetter setState) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: occopationList.map(
          (occ) {
            bool isSelected = false;
            if (selectedOccopationList.contains(occ)) {
              isSelected = true;
            }
            return GestureDetector(
              onTap: () {
                if (!selectedOccopationList.contains(occ)) {
                  if (selectedOccopationList.length < 10) {
                    selectedOccopationList.add(occ);
                    setState(() {});
                    print(selectedOccopationList);
                  }
                } else {
                  selectedOccopationList
                      .removeWhere((element) => element == occ);
                  setState(() {});
                  print(selectedOccopationList);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 0.5, color: ColorCodes.deepGrey)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                            value: isSelected,
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all(
                                ColorCodes.purpleBlue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            onChanged: ((value) {
                              isSelected = value!;
                            })),
                        Text(
                          occ,
                          style: GoogleFonts.anekBangla(
                              fontSize: 12, color: ColorCodes.deepGrey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  SfRangeSlider heightRangeWidget(StateSetter setState) {
    return SfRangeSlider(
      min: 4.0,
      max: 10.0,
      values: _valuesHeight,
      interval: 1,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      stepSize: 0.1,
      activeColor: ColorCodes.primaryPurple,
      minorTicksPerInterval: 0,
      onChanged: (SfRangeValues values) {
        setState(() {
          _valuesHeight = values;
        });
      },
    );
  }

  SfRangeSlider ageRangeWidget(StateSetter setState) {
    return SfRangeSlider(
      min: 18.0,
      max: 60.0,
      values: _valuesAge,
      interval: 20,
      stepSize: 1,
      showTicks: false,
      showLabels: true,
      enableTooltip: true,
      activeColor: ColorCodes.primaryPink,
      minorTicksPerInterval: 0,
      onChanged: (SfRangeValues values) {
        setState(() {
          _valuesAge = values;
        });
      },
    );
  }

  Container biodataTypeDropDown(BuildContext context, StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            hint: Text('বায়োডাটার ধরন',
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: _selectedBiodataType,
            onChanged: (newValue) {
              setState(() {
                _selectedBiodataType = newValue.toString();
              });
            },
            items: biodataType.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.toString(),
                  style: GoogleFonts.anekBangla(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorCodes.deepGrey),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Container marraigeTypeDropDown(BuildContext context, StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            hint: Text('বৈবাহিক অবস্থা',
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: _selectedMarraigeType,
            onChanged: (newValue) {
              setState(() {
                _selectedMarraigeType = newValue.toString();
              });
            },
            items: marraigeTypesList.map((e) {
              return DropdownMenuItem(
                value: e.name,
                onTap: () => setState((() => _selectedMarraigeTypeID = e.id)),
                child: Text(
                  e.name.toString(),
                  style: GoogleFonts.anekBangla(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorCodes.deepGrey),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Container countryDropDown(BuildContext context, StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            hint: Text('দেশ',
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: _selectedCountry,
            onChanged: (newValue) {
              setState(() {
                _selectedCountry = newValue.toString();
              });
            },
            items: countryList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.toString(),
                  style: GoogleFonts.anekBangla(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorCodes.deepGrey),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Container divisionTypeDropDown(BuildContext context, StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            hint: Text('বিভাগ',
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: _selectedDivision,
            onChanged: (newValue) {
              setState(() {
                _selectedDivision = newValue.toString();

                _selectedDivision == 'সকল' ? null : setDistrictAsDivision();
                if (_selectedDivision == 'সকল') {
                  districtList.clear();
                  thanaList.clear();
                  _selectedDistrict = null;
                  _selectedThana = null;
                }
              });
            },
            items: divisonList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.toString(),
                  style: GoogleFonts.anekBangla(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorCodes.deepGrey),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Container districtTypeDropDown(BuildContext context, StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            hint: Text('জেলা',
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: _selectedDistrict,
            onChanged: (newValue) {
              setState(() {
                _selectedDistrict = newValue.toString();
                _selectedDistrict == 'সকল'
                    ? null
                    : setThanaAsDivisionNDistrict();

                if (_selectedDistrict == 'সকল') {
                  thanaList.clear();
                  _selectedThana = null;
                }
              });
            },
            items: districtList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.toString(),
                  style: GoogleFonts.anekBangla(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorCodes.deepGrey),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Container thanaTypeDropDown(BuildContext context, StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            hint: Text('থানা',
                style: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: ColorCodes.deepGrey)), // Not necessary for Option 1
            value: _selectedThana,
            onChanged: (newValue) {
              setState(() {
                _selectedThana = newValue.toString();
              });
            },
            items: thanaList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    e.toString(),
                    style: GoogleFonts.anekBangla(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: ColorCodes.deepGrey),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Padding searchFieldWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: const [
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }

  _tableRow(String? title, data) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Text(
          title!,
          style: GoogleFonts.anekBangla(
              fontWeight: FontWeight.w500, color: ColorCodes.deepGrey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Text(
          ':',
          style: GoogleFonts.anekBangla(
              fontWeight: FontWeight.w500, color: ColorCodes.deepGrey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Text(
          data,
          style: GoogleFonts.anekBangla(
              fontWeight: FontWeight.w500, color: ColorCodes.deepGrey),
        ),
      ),
    ]);
  }

  clearAll(BuildContext context) {
    setState(() {
      districtList.clear();
      thanaList.clear();
      selectedHobby!.clear();
      selectedOccopationList.clear();
      _selectedMarraigeType = null;
      _selectedBiodataType = null;
      _selectedDivision = null;
      _selectedDistrict = null;
      _selectedThana = null;
      _selectedCountry = null;
      _valuesAge = const SfRangeValues(20.0, 30.0);
      _valuesHeight = const SfRangeValues(4.0, 8.0);
    });
  }
}
