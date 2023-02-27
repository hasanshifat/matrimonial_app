import 'dart:collection';

import 'package:flutter/material.dart';

import '../../Common UI/custom_text_form_field.dart';
import '../../Common UI/submit_button.dart';
import '../../Homepage/Services/district_service.dart';
import '../../Homepage/model/district_model.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/other_utils.dart';

class Addresspage extends StatefulWidget {
  const Addresspage({super.key});

  @override
  State<Addresspage> createState() => _AddresspageState();
}

class _AddresspageState extends State<Addresspage>
    with TickerProviderStateMixin {
  String hintText = 'নির্বাচন করুন';
  // String? selected;
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
  TextEditingController alakarNameController = TextEditingController();
  TextEditingController permanentAlakarNameController = TextEditingController();
  TextEditingController boroHowaAlakaController = TextEditingController();
  Size? pageSize;
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
    print('setDistrictAsDivision');
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        color: ColorCodes.deepGrey,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "একটি বিভাগ নির্বাচন করুন",
                      style: const TextTheme().bodyLarge,
                    ),
                  ],
                ),
                OtherUtils.height10,
                const Divider(
                  color: Colors.black,
                  height: 0.8,
                ),
                OtherUtils.height10,
                ListView.builder(
                    itemCount: divisonList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDivision = divisonList[index];
                              print(_selectedDivision);
                              print(divisonList[index]);

                              setDistrictAsDivision();
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
                                color: ColorCodes.deepGrey,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
                          color: ColorCodes.deepGrey,
                          size: 20,
                        ),
                      ),
                      OtherUtils.width10,
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
                      physics: const NeverScrollableScrollPhysics(),
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
                                OtherUtils.width10,
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: ColorCodes.deepGrey,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
                          color: ColorCodes.deepGrey,
                          size: 20,
                        ),
                      ),
                      OtherUtils.width10,
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
                      physics: const NeverScrollableScrollPhysics(),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  thanaList[index],
                                  style: const TextTheme().bodyMedium,
                                ),
                                OtherUtils.width10,
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: ColorCodes.deepGrey,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
                        color: ColorCodes.deepGrey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                OtherUtils.height10,
                const Divider(
                  color: Colors.black,
                  height: 0.8,
                ),
                OtherUtils.height10,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      animationController.reverse();
                    });
                    Future.delayed(const Duration(milliseconds: 400), () {
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              countryList[index],
                              style: const TextTheme().bodyMedium,
                            ),
                            OtherUtils.width10,
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: ColorCodes.deepGrey,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
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
                    Future.delayed(const Duration(milliseconds: 400), () {
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
                      physics: const NeverScrollableScrollPhysics(),
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
                "বাসার নাম্বার না লিখে শুধু এলাকার নাম লিখুন। যেমন- মিরপুর ১০, ঢাকা",
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
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.all(ColorCodes.purpleBlue),
                    value: isSameAddress,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onChanged: (bool? value) {
                      setState(() {
                        isSameAddress = !isSameAddress;
                      });
                    },
                  ),
                  Text(
                    "স্থায়ী ও বর্তমান ঠিকানা একই",
                    style: const TextTheme().bodyMedium,
                  )
                ],
              ),
              isSameAddress ? const SizedBox() : OtherUtils.height10,
              isPermanentCountry
                  ? permanentCountry()
                  : isPermanentDivision
                      ? permanentDivision()
                      : isPermanentZilla
                          ? permanentZilla()
                          : isPermanentUpoZilla
                              ? permanentUpoZilla()
                              : const SizedBox(),
              isSameAddress
                  ? const SizedBox()
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
                                      color:
                                          ColorCodes.deepGrey.withOpacity(0.5),
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
              isSameAddress ? const SizedBox() : OtherUtils.height10,
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
              isSameAddress ? const SizedBox() : OtherUtils.height10,
              isSameAddress
                  ? const SizedBox()
                  : Text(
                      "বাসার নাম্বার না লিখে শুধু এলাকার নাম লিখুন। যেমন- মিরপুর ১০, ঢাকা",
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
                hintText: "ঢাকা",
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
