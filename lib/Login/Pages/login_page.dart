import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/loading_diaalogs.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';
import 'package:matrimonial_app/SignUp/Pages/registration_page.dart';
import 'package:matrimonial_app/Utils/color_codes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Common UI/custom_text_form_field.dart';
import '../Services/login_service.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/loginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginService loginService;
  bool isChecked = false;
  bool isPassShow = true;
  late SharedPreferences prefs;
  @override
  void initState() {
    loginService = LoginService();
    isSavedPassword();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future isSavedPassword() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      bool? val = prefs.getBool('isCheked');
      isChecked = val!;
    });
    if (isChecked) {
      setState(() {
        String? name = prefs.getString('username');
        String? pass = prefs.getString('password');
        _emailController.text = name!;
        _passwordController.text = pass!;
      });
    }
  }

  savePassword() async {
    prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      setState(() {
        prefs.setString('username', _emailController.text);
        prefs.setString('password', _passwordController.text);
        prefs.setBool('isCheked', true);
      });
    } else {
      setState(() {
        prefs.setString('username', '');
        prefs.setString('password', '');
        prefs.setBool('isCheked', false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'বিডি',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Username',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Password',
                                obscureText: isPassShow,
                                isSuffixActive: true,
                                suffix: IconButton(
                                    onPressed: (() {
                                      setState(() {
                                        if (isPassShow) {
                                          isPassShow = false;
                                        } else {
                                          isPassShow = true;
                                        }

                                        print(isPassShow);
                                      });
                                    }),
                                    icon: isPassShow
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.all(
                                        ColorCodes.purpleBlue),
                                    value: isChecked,
                                    shape: const CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                        savePassword();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'মনে রাখুন',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorCodes.purpleBlue),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'পাসওয়ার্ড ভুলে গেছেন?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: ColorCodes.seconderyStrongPink),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SubmitButton(
                                  elevation: 0,
                                  borderColor: Colors.transparent,
                                  gradColor1: ColorCodes.seconderyStrongPink,
                                  gradColor2: ColorCodes.primaryPink,
                                  borderWidth: 0,
                                  text: "লগইন করুন",
                                  buttonRadius: 10,
                                  height: 50,
                                  width: double.infinity,
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.white,
                                  textSize: 14,
                                  press: (() => {
                                        if (_loginFormKey.currentState!
                                            .validate())
                                          {login()}
                                      })),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 0.5,
                                      width: double.infinity,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'অথবা',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 0.5,
                                      width: double.infinity,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'অ্যাকাউন্ট নেই?',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SubmitButton(
                                  elevation: 0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  text: "নতুন অ্যাকাউন্ট তৈরি করুন",
                                  gradColor1: ColorCodes.purpleBlue,
                                  gradColor2: ColorCodes.purpleBlue,
                                  buttonRadius: 10,
                                  height: 50,
                                  width: double.infinity,
                                  fontWeight: FontWeight.w500,
                                  textColor: Colors.white,
                                  textSize: 14,
                                  press: (() =>
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RegistrationPage.routeName,
                                        (route) => true,
                                      ))),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future login() async {
    CustomLoadingDialogs.circleProggressLoading(context);
    await loginService.loginService(
        context, _emailController.text, _passwordController.text);

    Navigator.of(context).pop();
  }
}
