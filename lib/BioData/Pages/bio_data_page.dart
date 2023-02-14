import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';
import 'package:matrimonial_app/Constants/strings.dart';

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

  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));
  late AnimationController divisonAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));
  late AnimationController zillaAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));
  late AnimationController upoZillaAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 200));
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

  @override
  void initState() {
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
                        Future.delayed(Duration(milliseconds: 200), () {
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
                    const Text(
                      "একটি বিভাগ নির্বাচন করুন",
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
                      divisonAnimationController.reverse();
                    });
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        isDivision = false;
                        isZilla = true;
                        zillaAnimationController.forward();
                        print("is division ${isDivision}");
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("রাজশাহী"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                )
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
                        Future.delayed(Duration(milliseconds: 200), () {
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
                    const Text(
                      "একটি জেলা নির্বাচন করুন",
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
                      zillaAnimationController.reverse();
                    });
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        isZilla = false;
                        isUpoZilla = true;
                        upoZillaAnimationController.forward();
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("পাবনা"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                )
              ],
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
                        Future.delayed(Duration(milliseconds: 200), () {
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
                    const Text(
                      "একটি উপজেলা নির্বাচন করুন",
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
                      upoZillaAnimationController.reverse();
                    });

                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        isUpoZilla = false;
                        isButtonShow = true;
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("বেড়া"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                )
              ],
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
                    const Text(
                      "দেশ নির্বাচন করুন",
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          animationController.reverse();
                        });
                        Future.delayed(Duration(milliseconds: 200), () {
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
                    Future.delayed(Duration(milliseconds: 200), () {
                      setState(() {
                        isCountry = false;
                        isDivision = true;
                        print(isCountry);
                        divisonAnimationController.forward();
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("বাংলাদেশ"),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
          style: GoogleFonts.anekBangla(
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
        graytext("Next: ঠিকানা"),
        const SizedBox(
          height: 10,
        ),
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
                      border: Border.all(
                        width: 0.8,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ঠিকানা নির্বাচন করুন"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                )
              : Text(''),
        ),
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
        graytext("Next: ঠিকানা"),
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
