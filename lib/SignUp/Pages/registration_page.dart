import 'package:flutter/material.dart';
import 'package:matrimonial_app/Login/Provider/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registrationPage';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late SharedPreferences prefs;
  String? token = '';
  @override
  void initState() {
    sharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: userdata.data!
              .map((e) => ListTile(
                    title: Text(e.userName!),
                  ))
              .toList(),
        ),
      )),
    );
  }

  Future sharedPref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
    });
  }
}
