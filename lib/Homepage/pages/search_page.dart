import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/custom_drop_down.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';
import '../Services/district_service.dart';
import '../model/district_model.dart';
import '../model/marraige_type.dart';

class SearchingPage extends StatefulWidget {
  static const String routeName = '/SearchingPage';
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  String? _selectedMarraigeType;
  int? _selectedMarraigeTypeID;
  String? _selectedBiodataType;
  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedThana;
  String? _selectedCountry;
  SfRangeValues _valuesAge = const SfRangeValues(20.0, 30.0);
  SfRangeValues _valuesHeight = const SfRangeValues(4.0, 8.0);
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
  Size? pageSize;
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'বায়োডাটা অনুসন্ধান করুন',
          style: GoogleFonts.anekBangla(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "আপনার প্রয়োজন অনুযায়ী বায়োডাটা ফিল্টার করুন",
                  style: GoogleFonts.anekBangla(
                      fontWeight: FontWeight.w500,
                      color: ColorCodes.deepGrey,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        )),
      ),
      floatingActionButton: filterWidget(),
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
                border: Border.all(
                    color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5),
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
                        color: ColorCodes.deepGrey,
                        decoration: TextDecoration.none),
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
                                  OtherUtils.width10,
                                  Expanded(
                                      child: divisionTypeDropDown(
                                          context, setState)),
                                ],
                              ),
                              OtherUtils.height5,
                              Row(
                                children: [
                                  districtList.isEmpty
                                      ? const SizedBox()
                                      : Expanded(
                                          child: districtTypeDropDown(
                                              context, setState)),
                                  OtherUtils.width10,
                                  thanaList.isEmpty
                                      ? const SizedBox()
                                      : Expanded(
                                          child: thanaTypeDropDown(
                                              context, setState))
                                ],
                              ),
                              OtherUtils.height10,
                              Text(
                                "বয়স নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),
                              ageRangeWidget(setState),
                              OtherUtils.height10,
                              Text(
                                "উচ্চতা নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),

                              heightRangeWidget(setState),
                              OtherUtils.height10,
                              Text(
                                "শখ ও আগ্রহ নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),
                              OtherUtils.height10,
                              hobbiesFilterWidget(setState),
                              OtherUtils.height10,
                              Text(
                                "পেশা নির্বাচন করুন",
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey),
                              ),
                              OtherUtils.height5,
                              occopationFilterWidget(setState),
                              OtherUtils.height10,
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

  biodataTypeDropDown(BuildContext context, StateSetter setState) {
    return CustomDropDownBtn(
        selectedID: _selectedBiodataType,
        onChanged: (value) {
          setState(() {
            _selectedBiodataType = value.toString();
          });
        },
        onTap: () {},
        hint: 'বায়োডাটার ধরন',
        items: biodataType);
  }

  marraigeTypeDropDown(BuildContext context, StateSetter setState) {
    List<String> list = [];
    for (var element in marraigeTypesList) {
      setState((() => list.add(element.name!)));
    }
    return CustomDropDownBtn(
        selectedID: _selectedMarraigeType,
        onChanged: (value) {
          setState(() {
            _selectedMarraigeType = value.toString();
          });
        },
        onTap: () {},
        hint: 'বৈবাহিক অবস্থা',
        items: list);
  }

  countryDropDown(BuildContext context, StateSetter setState) {
    return CustomDropDownBtn(
        selectedID: _selectedCountry,
        onChanged: (value) {
          setState(() {
            _selectedCountry = value.toString();
          });
        },
        onTap: () {},
        hint: 'দেশ',
        items: countryList);
  }

  divisionTypeDropDown(BuildContext context, StateSetter setState) {
    return CustomDropDownBtn(
        selectedID: _selectedDivision,
        onChanged: (value) {
          setState(() {
            _selectedDivision = value.toString();

            _selectedDivision == 'সকল' ? null : setDistrictAsDivision();
            if (_selectedDivision == 'সকল') {
              districtList.clear();
              thanaList.clear();
              _selectedDistrict = null;
              _selectedThana = null;
            }
          });
        },
        onTap: () {},
        hint: 'বিভাগ',
        items: divisonList);
  }

  districtTypeDropDown(BuildContext context, StateSetter setState) {
    return CustomDropDownBtn(
        selectedID: _selectedDistrict,
        onChanged: (value) {
          setState(() {
            _selectedDistrict = value.toString();
            _selectedDistrict == 'সকল' ? null : setThanaAsDivisionNDistrict();

            if (_selectedDistrict == 'সকল') {
              thanaList.clear();
              _selectedThana = null;
            }
          });
        },
        onTap: () {},
        hint: 'জেলা',
        items: districtList);
  }

  thanaTypeDropDown(BuildContext context, StateSetter setState) {
    return CustomDropDownBtn(
        selectedID: _selectedThana,
        onChanged: (value) {
          setState(() {
            _selectedThana = value.toString();
          });
        },
        onTap: () {},
        hint: 'থানা',
        items: thanaList);
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
}
