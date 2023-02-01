import 'package:flutter/material.dart';
import 'package:matrimonial_app/Common%20UI/submit_button.dart';

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
  final TextEditingController _nameController = TextEditingController();
  late LoginService loginService;
  @override
  void initState() {
    // TODO: implement initState
    loginService = LoginService();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 10),
                  SubmitButton(
                      elevation: 0,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      text: "Login",
                      buttonRadius: 10,
                      height: 50,
                      width: double.infinity,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      textSize: 14,
                      press: (() => login()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    loginService.loginService(
        context, _emailController.text, _passwordController.text);
  }
}
