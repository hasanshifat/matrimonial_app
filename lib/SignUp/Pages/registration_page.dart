import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';

import '../../Common UI/custom_text_form_field.dart';
import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registrationPage';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  bool isChecked = false;
  bool isPassShow = true;
  bool isPassCShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'রেজিস্ট্রেশন',
          style: GoogleFonts.anekBangla(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  controller: _fNameController,
                  hintText: 'নামের প্রথম অংশ',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 30,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'আপনার নামের প্রথম অংশ দিন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _lNameController,
                  hintText: 'নামের শেষাংশ',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 15,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'আপনার নামের শেষাংশ দিন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _numController,
                  hintText: 'মোবাইল নম্বর',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 11,
                  validator: (val) {
                    if (val == null) {
                      return 'আপনার মোবাইল নম্বর দিন';
                    } else if (val.length < 6) {
                      return 'আপনি ভুল মোবাইল নম্বর দিয়েছেন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'পাসওয়ার্ড',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: isPassShow,
                  isSuffixActive: true,
                  maxLength: 6,
                  validator: (val) {
                    if (val == null) {
                      return 'আপনার পাসওয়ার্ড দিন';
                    } else if (val.length < 6) {
                      return 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে';
                    }
                    return null;
                  },
                  suffix: IconButton(
                      onPressed: (() {
                        setState(() {
                          if (isPassShow) {
                            isPassShow = false;
                          } else {
                            isPassShow = true;
                          }
                        });
                      }),
                      icon: isPassShow
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordConfirmController,
                  hintText: 'পাসওয়ার্ড নিশ্চিত করুন',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: isPassCShow,
                  isSuffixActive: true,
                  maxLength: 6,
                  validator: (val) {
                    if (val == null) {
                      return 'আপনার পাসওয়ার্ড দিন';
                    } else if (val.length < 6) {
                      return 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে';
                    }
                    return null;
                  },
                  suffix: IconButton(
                      onPressed: (() {
                        setState(() {
                          if (isPassCShow) {
                            isPassCShow = false;
                          } else {
                            isPassCShow = true;
                          }
                        });
                      }),
                      icon: isPassCShow
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                ),
                const SizedBox(height: 50),
                SubmitButton(
                    elevation: 0,
                    borderColor: Colors.transparent,
                    gradColor1: ColorCodes.seconderyStrongPink,
                    gradColor2: ColorCodes.softRed,
                    borderWidth: 0,
                    text: "রেজিস্ট্রেশন করুন",
                    buttonRadius: 10,
                    height: 50,
                    width: double.infinity,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                    textSize: 16,
                    press: (() => {
                          if (_signupFormKey.currentState!.validate())
                            {
                              if (_passwordController.text !=
                                  _passwordConfirmController.text)
                                {
                                  CustomSnackBars().showSnackBar(
                                    context,
                                    'পাসওয়ার্ড মেলেনি',
                                    ColorCodes.softRed,
                                  )
                                }
                            }
                        })),
              ],
            )),
      )),
    );
  }
}
