import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Common%20UI/loading_diaalogs.dart';
import 'package:matrimonial_app/Login/Pages/login_page.dart';
import 'package:matrimonial_app/SignUp/Pages/registration_page.dart';
import 'package:matrimonial_app/Utils/color_codes.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/snackbars.dart';
import '../Services/registration_service.dart';

class OtpVerifyPage extends StatefulWidget {
  static const String routeName = '/otpPage';
  static String number = '';
  static Map<String, String> regMasterDataa = {};
  static Map<String, String> logMaterData = {};
  const OtpVerifyPage({super.key});

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final controller = TextEditingController();
  String? n1, n2, n3, n4, n5, n6;
  String? smscode;
  String? verifyID;

  Timer? _timer;
  int _start = 59;
  String? mint = '00';
  late RegistrationService registrationService;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            mint = '01';
            n1 = null;
            n2 = null;
            n3 = null;
            n4 = null;
            n5 = null;
            n6 = null;
            smscode = null;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    registrationService = RegistrationService();
    startTimer();
    sendCode();
    print(OtpVerifyPage.number);
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Future sendCode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+88${OtpVerifyPage.number.toString().trim()}',
      verificationCompleted: (PhoneAuthCredential credential) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RegistrationPage.routeName,
          (route) => true,
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        print(verificationId);
        setState(() {
          verifyID = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          CustomSnackBars().showSnackBar(
            context,
            'প্ফোন নম্বরটি সঠিক নয়৷',
            ColorCodes.softRed,
          );
          print('The provided phone number is not valid.');
        }
      },
    );
  }

  Future verify() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var isverified = await firebaseAuth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verifyID.toString(),
              smsCode: smscode.toString()));
      print(isverified.user!.phoneNumber);
      if (isverified.user!.phoneNumber ==
          '+88${OtpVerifyPage.number.toString().trim()}') {
        // ignore: use_build_context_synchronously
        // Navigator.pushNamedAndRemoveUntil(
        //   context,
        //   RegistrationPage.routeName,
        //   (route) => true,
        // );
        // ignore: use_build_context_synchronously
        registrationService.regService(
            context, OtpVerifyPage.regMasterDataa, OtpVerifyPage.logMaterData);
      } else {
        // ignore: use_build_context_synchronously
        CustomSnackBars().showSnackBar(
          context,
          "আপনি ভুল OTP প্রবেশ করেছেন",
          ColorCodes.softRed,
        );
      }
    } catch (e) {
      CustomSnackBars().showSnackBar(
        context,
        "$e",
        ColorCodes.softRed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'OTP যাচাই করুন',
            style: GoogleFonts.anekBangla(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                otpInputField(n1),
                otpInputField(n2),
                otpInputField(n3),
                otpInputField(n4),
                otpInputField(n5),
                otpInputField(n6)
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'সময়',
            style: GoogleFonts.anekBangla(
                fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(
            '$mint:${_timer!.tick}',
            style: GoogleFonts.anekBangla(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(
            'আবার ওটিপি পাঠান',
            style: GoogleFonts.anekBangla(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorCodes.seconderyStrongPink),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SubmitButton(
                elevation: 0,
                borderColor: Colors.transparent,
                gradColor1: smscode.toString().length < 5
                    ? Colors.grey
                    : ColorCodes.softGreen,
                gradColor2: smscode.toString().length < 5
                    ? Colors.grey
                    : ColorCodes.softGreen,
                borderWidth: 0,
                text: "OTP যাচাই করুন",
                buttonRadius: 10,
                height: 50,
                width: double.infinity,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
                textSize: 16,
                press: (() async {
                  try {
                    CustomLoadingDialogs.circleProgressLoading(context);
                    await verify();
                    Navigator.pop(context);
                  } catch (e) {
                    CustomSnackBars().showSnackBar(
                      context,
                      "আপনি ভুল OTP প্রবেশ করেছেন",
                      ColorCodes.softRed,
                    );
                  }
                })),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          Row(
            children: [numberField('1'), numberField('2'), numberField('3')],
          ),
          Row(
            children: [numberField('4'), numberField('5'), numberField('6')],
          ),
          Row(
            children: [numberField('7'), numberField('8'), numberField('9')],
          ),
          Row(
            children: [numberField('0'), clearField()],
          )
        ],
      )),
    );
  }

  otpInputField(String? n) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
                color:
                    n == null ? ColorCodes.primaryPurple : Colors.transparent,
                width: n == null ? 0 : 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(n ?? '_',
                style: GoogleFonts.anekBangla(
                    fontSize: 18, fontWeight: FontWeight.w500))));
  }

  numberField(String number) {
    return Expanded(
        child: InkWell(
      onTap: () {
        setState(() {
          if (n1 == null) {
            n1 = number;
          } else if (n2 == null) {
            n2 = number;
          } else if (n3 == null) {
            n3 = number;
          } else if (n4 == null) {
            n4 = number;
          } else if (n5 == null) {
            n5 = number;
          } else {
            n6 = number;
            smscode = n1! + n2! + n3! + n4! + n5! + n6!;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                number,
                style: GoogleFonts.anekBangla(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ))),
      ),
    ));
  }

  clearField() {
    return Expanded(
        child: InkWell(
      onTap: () {
        setState(() {
          if (n6 != null) {
            n6 = null;
            smscode = null;
          } else if (n5 != null) {
            n5 = null;
          } else if (n4 != null) {
            n4 = null;
          } else if (n3 != null) {
            n3 = null;
          } else if (n2 != null) {
            n2 = null;
          } else if (n1 != null) {
            n1 = null;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5)),
            child: const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Icon(
                      Icons.backspace,
                      color: Colors.black87,
                    )))),
      ),
    ));
  }
}
