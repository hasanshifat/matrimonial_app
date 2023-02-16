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
  String? selectedEducation;

  String hintText = 'নির্বাচন করুন';
  String? selected;
  bool isGeneralInfo = false;
  bool isSameAddress = false;

  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController animationController2 = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController divisonAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController permanentDivisonAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController zillaAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController permanentZillaAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController upoZillaAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 400));
  late AnimationController permanentUpoZillaAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400));
  // late AnimationController animationControllerReverse =
  //     AnimationController(vsync: this, duration: const Duration(seconds: 1))
  //       ..reverse();
  late Animation<double> animation = CurvedAnimation(
      parent: animationController, curve: Curves.easeInOutCubic);
  late Animation<double> animation2 = CurvedAnimation(
      parent: animationController2, curve: Curves.easeInOutCubic);
  late Animation<double> divisonAnimation = CurvedAnimation(
      parent: divisonAnimationController, curve: Curves.easeInOutCubic);
  late Animation<double> permanentDivisonAnimation = CurvedAnimation(
      parent: permanentDivisonAnimationController,
      curve: Curves.easeInOutCubic);
  late Animation<double> zillaAnimation = CurvedAnimation(
      parent: zillaAnimationController, curve: Curves.easeInOutCubic);
  late Animation<double> permanentZillaAnimation = CurvedAnimation(
      parent: permanentZillaAnimationController, curve: Curves.easeInOutCubic);
  late Animation<double> upoZillaAnimation = CurvedAnimation(
      parent: upoZillaAnimationController, curve: Curves.easeInOutCubic);
  late Animation<double> permanentUpoZillaAnimation = CurvedAnimation(
      parent: permanentUpoZillaAnimationController,
      curve: Curves.easeInOutCubic);

  bool isButtonShow = true;
  bool isPermanentButtonShow = true;
  bool isCountry = true;
  bool isPermanentCountry = true;
  bool isDivision = false;
  bool isZilla = false;
  bool isUpoZilla = false;
  bool isPermanentDivision = false;
  bool isPermanentZilla = false;
  bool isPermanentUpoZilla = false;
  late List<DistrictModel> divDisThanaList;
  late List<String> divisonList;
  late List<String> divisonList2;
  late List<String> districtList;
  late List<String> districtList2;
  late List<String> thanaList;
  late List<String> thanaList2;
  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedThana;
  String? _selectedPermanentDivision;
  String? _selectedPermanentDistrict;
  String? _selectedPermanentThana;
  String? _selectedCountry;
  late List<String> countryList;

  @override
  void initState() {
    divisonList = [];
    districtList = [];
    districtList2 = [];
    thanaList = [];
    thanaList2 = [];
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
        divisonList2 = divresult;
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

  setDistrictAsDivision2() {
    List dis = [];
    List<String> divresult = [];
    setState(() {
      _selectedPermanentDistrict = null;
      _selectedPermanentThana = null;

      for (var element in divDisThanaList) {
        if (element.division == _selectedPermanentDivision) {
          dis.add(element.district.toString());
          divresult = LinkedHashSet<String>.from(dis).toList();
        }
        districtList2 = divresult;
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

  setThanaAsDivisionNDistrict2() {
    List dis = [];
    List<String> divresult = [];
    setState(() {
      _selectedPermanentThana = null;
      for (var element in divDisThanaList) {
        if (element.district == _selectedPermanentDistrict) {
          dis.add(element.upazila.toString());
          divresult = LinkedHashSet<String>.from(dis).toList();
        }
        thanaList2 = divresult;
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

  Widget permanentDivision() {
    return SizeTransition(
      sizeFactor: permanentDivisonAnimation,
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
                          permanentDivisonAnimationController.reverse();
                        });
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() {
                            isPermanentCountry = true;
                            animationController2.forward();
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
                    itemCount: divisonList2.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            _selectedPermanentDivision = divisonList2[index];
                            setDistrictAsDivision2();

                            setState(() {
                              permanentDivisonAnimationController.reverse();
                            });
                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              setState(() {
                                isPermanentDivision = false;
                                isPermanentZilla = true;
                                permanentZillaAnimationController.forward();
                              });
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                divisonList2[index],
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

  Widget permanentZilla() {
    return SizeTransition(
      sizeFactor: permanentZillaAnimation,
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
                            permanentZillaAnimationController.reverse();
                          });
                          Future.delayed(const Duration(milliseconds: 400), () {
                            setState(() {
                              isPermanentDivision = true;
                              permanentDivisonAnimationController.forward();
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
                      itemCount: districtList2.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              _selectedPermanentDistrict = districtList2[index];
                              setThanaAsDivisionNDistrict2();
                              setState(() {
                                permanentZillaAnimationController.reverse();
                              });
                              Future.delayed(const Duration(milliseconds: 400),
                                  () {
                                setState(() {
                                  isPermanentZilla = false;
                                  isPermanentUpoZilla = true;
                                  permanentUpoZillaAnimationController
                                      .forward();
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  districtList2[index],
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

  Widget permanentUpoZilla() {
    return SizeTransition(
      sizeFactor: permanentUpoZillaAnimation,
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
                            permanentUpoZillaAnimationController.reverse();
                          });
                          Future.delayed(const Duration(milliseconds: 400), () {
                            setState(() {
                              isPermanentZilla = true;
                              permanentZillaAnimationController.forward();
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
                      itemCount: thanaList2.length,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {
                              _selectedPermanentThana = thanaList2[index];
                              setState(() {
                                upoZillaAnimationController.reverse();
                              });

                              Future.delayed(const Duration(milliseconds: 400),
                                  () {
                                setState(() {
                                  isPermanentUpoZilla = false;
                                  isPermanentButtonShow = true;
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  thanaList2[index],
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

  Widget permanentCountry() {
    return SizeTransition(
      sizeFactor: animation2,
      axis: Axis.vertical,
      axisAlignment: 10.0,
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
                          animationController2.reverse();
                        });
                        Future.delayed(const Duration(milliseconds: 400), () {
                          setState(() {
                            isPermanentButtonShow = true;
                            print(isPermanentButtonShow);
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
                      animationController2.reverse();
                    });
                    Future.delayed(Duration(milliseconds: 400), () {
                      setState(() {
                        isPermanentCountry = false;
                        isPermanentDivision = true;

                        permanentDivisonAnimationController.forward();
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
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextTheme().bodyMedium,
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

  Widget educationDropDown(List<String> list) {
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
          value: selectedEducation,
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
              selectedEducation = value!;
              // ss(selected);
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextTheme().bodyMedium,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  String? selectedGeneralEducationHeighestDegree;
  Widget generalEducationHeighestDropDown(List<String> list) {
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
          value: selectedGeneralEducationHeighestDegree,
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
              selectedGeneralEducationHeighestDegree = value!;
              // ss(selected);
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextTheme().bodyMedium,
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
  TextEditingController permanentAlakarNameController = TextEditingController();
  TextEditingController boroHowaAlakaController = TextEditingController();

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              title: Text(
                'জীবন বৃত্তান্ত ',
                style: const TextTheme().labelLarge,
              ),
              centerTitle: true,
              elevation: 0,
              // backgroundColor: Colors.amberAccent,
              bottom: TabBar(tabs: [
                Text(
                  "সাধারণ তথ্য",
                  style: const TextTheme().bodyMedium,
                ),
                Text(
                  "ঠিকানা",
                  style: const TextTheme().bodyMedium,
                ),
                Text(
                  "শিক্ষা",
                  style: const TextTheme().bodyMedium,
                ),
              ]),
            )),
        body: SafeArea(
            child: TabBarView(
          children: [
            generalInfo(),
            address(),
            education(),
          ],
        )),
      ),
    );
  }

  TextEditingController sscDakhilSomomanController = TextEditingController();
  TextEditingController hscAlimSomomanController = TextEditingController();
  TextEditingController hounsFazilSomomanController = TextEditingController();
  TextEditingController instituteName = TextEditingController();
  TextEditingController graduationYear = TextEditingController();
  TextEditingController postGraduationDept = TextEditingController();
  TextEditingController postGraduationDeptInstitute = TextEditingController();
  TextEditingController postGraduationYear = TextEditingController();
  TextEditingController phdSubject = TextEditingController();
  TextEditingController phdInstitute = TextEditingController();
  TextEditingController phdYear = TextEditingController();
  TextEditingController otherEducation = TextEditingController();
  TextEditingController islamicEducationTitle = TextEditingController();

  String? selectedEducationDept;
  String? selectedSscResult;
  String? selectHscOrDeploma;
  Widget education() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fieldLabel("আপনার শিক্ষা মাধ্যম"),
            educationDropDown(AppConstants.educationType),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("সর্বোচ্চ শিক্ষাগত যোগ্যতা"),
            generalEducationHeighestDropDown(AppConstants.generalEduHstDgr),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("এস.এস.সি / দাখিল / সমমান পাসের সন"),
            CustomTextField(
              controller: sscDakhilSomomanController,
              hintText: "2012",
              maxLength: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("বিভাগ"),
            dropDown(AppConstants.educationDept, selectedEducationDept),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("ফলাফল"),
            dropDown(AppConstants.sscResult, selectedSscResult),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("SSC পরে কোন মাধ্যমে পড়াশুনা করেছেন?"),
            dropDown(['HSC', 'ডিপ্লোমা'], selectHscOrDeploma),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("এইচ.এস.সি / আলিম / সমমান পাসের সন"),
            CustomTextField(
              controller: hscAlimSomomanController,
              hintText: '2014',
              maxLength: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("বিভাগ"),
            dropDown(AppConstants.educationDept, selectedEducationDept),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("ফলাফল"),
            dropDown(AppConstants.sscResult, selectedSscResult),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("স্নাতক / স্নাতক (সম্মান) / ফাজিল পড়াশোনার বিষয়"),
            CustomTextField(
              controller: hounsFazilSomomanController,
              hintText: "কম্পিউটার বিজ্ঞান ও প্রকৌশল",
              maxLength: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম "),
            CustomTextField(
              controller: instituteName,
              hintText: "বাংলাদেশ প্রকৌশল বিশ্ববিদ্যালয়",
              maxLength: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("পাসের সন"),
            CustomTextField(
              controller: graduationYear,
              hintText: "2018",
              maxLength: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("স্নাতকোত্তর / কামিল পড়াশোনার বিষয়"),
            CustomTextField(
                controller: postGraduationDept,
                hintText: "এমএসসি ইন টেক্সটাইল ইঞ্জিনিয়ারিং"),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম"),
            CustomTextField(
                controller: postGraduationDeptInstitute,
                hintText: "বাংলাদেশ টেক্সটাইল বিশ্ববিদ্যালয়"),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("পাসের সন"),
            CustomTextField(
              controller: postGraduationYear,
              hintText: "2020",
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
            const SizedBox(
              height: 10,
            ),
            fieldLabel("শিক্ষাপ্রতিষ্ঠানের নাম"),
            CustomTextField(
              controller: phdInstitute,
              hintText: "",
              maxLength: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            fieldLabel("পাসের সন"),
            CustomTextField(
              controller: phdYear,
              hintText: "",
              maxLength: 100,
            ),
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
                    width: 140,
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
                    width: 140,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                    textSize: 14,
                    press: (() => {})),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget address() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            fieldLabel("স্থায়ী ঠিকানা"),
            isCountry
                ? country()
                : isDivision
                    ? division()
                    : isZilla
                        ? zilla()
                        : isUpoZilla
                            ? upoZilla()
                            : const Text(""),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
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
            (_selectedDistrict != null &&
                    _selectedDivision != null &&
                    _selectedThana != null)
                ? CustomTextField(
                    controller: alakarNameController,
                    hintText: "এলাকার নাম লিখুন",
                    maxLength: 100,
                  )
                : const Text(''),
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
            ),
            const SizedBox(
              height: 10,
            ),
            isPermanentCountry
                ? permanentCountry()
                : isPermanentDivision
                    ? permanentDivision()
                    : isPermanentZilla
                        ? permanentZilla()
                        : isPermanentUpoZilla
                            ? permanentUpoZilla()
                            : const Text(""),
            isSameAddress
                ? const Text('')
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        isPermanentButtonShow = false;
                        isPermanentCountry = true;
                        animationController2.forward();
                      });
                    },
                    child: isPermanentButtonShow
                        ? Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorCodes.deepGrey.withOpacity(0.5),
                                    width: 0.5)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (_selectedPermanentDistrict == null ||
                                            _selectedPermanentDivision ==
                                                null ||
                                            _selectedPermanentThana == null)
                                        ? "ঠিকানা নির্বাচন করুন"
                                        : _selectedPermanentDistrict ==
                                                _selectedPermanentDivision
                                            ? "$_selectedPermanentThana, $_selectedPermanentDistrict"
                                            : "$_selectedPermanentThana, $_selectedPermanentDistrict, $_selectedPermanentDivision  ",
                                    style: const TextTheme().bodyMedium,
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          )
                        : const Text(''),
                  ),
            SizedBox(
              height: isSameAddress ? 0 : 10,
            ),
            (_selectedPermanentDistrict != null &&
                    _selectedPermanentDivision != null &&
                    _selectedPermanentThana != null &&
                    isSameAddress == false)
                ? CustomTextField(
                    controller: permanentAlakarNameController,
                    hintText: "এলাকার নাম লিখুন",
                    maxLength: 100,
                  )
                : const Text(''),
            SizedBox(
              height: isSameAddress ? 0 : 10,
            ),
            isSameAddress
                ? const Text('')
                : Text(
                    "বাসার নাম্বার না লিখে শুধু এলাকার নাম লিখুন। যেমন- মিরপুর ১০, বাঘমারা।",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextTheme().bodyLarge,
                  ),
            SizedBox(
              height: isSameAddress ? 0 : 10,
            ),
            fieldLabel("কোথায় বড় হয়েছেন?"),
            CustomTextField(
              controller: boroHowaAlakaController,
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
                    width: 140,
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
                    width: 140,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                    textSize: 14,
                    press: (() => {})),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget generalInfo() {
    return SingleChildScrollView(
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
                    width: 140,
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
                    width: 140,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                    textSize: 14,
                    press: (() => {})),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
