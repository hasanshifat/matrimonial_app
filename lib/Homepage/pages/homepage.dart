import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';
import 'package:matrimonial_app/Homepage/Services/district_service.dart';
import 'package:matrimonial_app/Homepage/model/district_model.dart';
import 'package:matrimonial_app/Utils/color_codes.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../model/marraige_type.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final searchController = TextEditingController();
  List<String> hobbiList = ['Reading', 'Writing', 'Singing', 'Cooking'];
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
  SfRangeValues _valuesAge = SfRangeValues(20.0, 30.0);
  SfRangeValues _valuesHeight = SfRangeValues(4.0, 10.0);
  @override
  void initState() {
    divisonList = [];
    districtList = [];
    thanaList = [];
    divDisThanaList = [];
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
    List dis = [];
    List thana = [];
    setState(() {
      divDisThanaList = list;
      for (var element in divDisThanaList) {
        div.add(element.division.toString());
        //dis.add(element.district.toString());
        //thanaList.add(element.upazila.toString());
        List<String> divresult = LinkedHashSet<String>.from(div).toList();
        //List<String> disresult = LinkedHashSet<String>.from(dis).toList();
        // List<String> thanaresult = LinkedHashSet<String>.from(div).toList();
        divisonList = divresult;
        //districtList = disresult;
        // thanaList = thanaresult;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              filterWidget(),
              const SizedBox(
                height: 10,
              ),
              contentWidget(context),
              contentWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding contentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    // color: ColorCodes.purpleBlue.withOpacity(0.1),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorCodes.seconderyStrongPink,
                        ColorCodes.primaryPink,
                      ],
                      stops: [0.2, 2.0],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          maxRadius: 100,
                          backgroundColor: Colors.white,
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
                    ),
                    Text(
                      'MAF102',
                      style: GoogleFonts.anekBangla(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      children: [
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Chip(
                                            backgroundColor: ColorCodes
                                                .primaryPurple
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
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
                              press: (() {})),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Row filterWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
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
          child: Container(
            decoration: BoxDecoration(
                color: ColorCodes.seconderyStrongPink.withOpacity(0.05),
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
                  const Icon(Icons.filter_list,
                      color: ColorCodes.seconderyStrongPink),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ফিল্টার",
                    style: GoogleFonts.anekBangla(
                        fontWeight: FontWeight.w500,
                        color: ColorCodes.seconderyStrongPink),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            biodataTypeDropDown(),
                            marraigeTypeDropDown(),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        //filterLocation()
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: countryDropDown(context, setState)),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child:
                                      divisionTypeDropDown(context, setState)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
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
                                      child:
                                          thanaTypeDropDown(context, setState))
                            ],
                          ),
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
                        SfRangeSlider(
                          min: 18.0,
                          max: 80.0,
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
                        ),
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
                        SfRangeSlider(
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

  Container filterLocation() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
          title: Text(
            _selectedDivision.toString(),
            style: GoogleFonts.anekBangla(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: ColorCodes.deepGrey),
          ),
          onExpansionChanged: (value) {
            print(value);
          },
          children: [
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                child: Column(
                  children: divisonList
                      .map((e) => ListTile(
                            onTap: () => setState(() {
                              _selectedDivision = e;
                            }),
                            title: Text(
                              e,
                              style: GoogleFonts.anekBangla(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: ColorCodes.deepGrey),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )
          ]),
    );
  }

  Container biodataTypeDropDown() {
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

  Container marraigeTypeDropDown() {
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
                setDistrictAsDivision();
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
        padding: const EdgeInsets.only(left: 5),
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
                setThanaAsDivisionNDistrict();
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
}