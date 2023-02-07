import 'package:flutter/material.dart';
import 'package:matrimonial_app/Login/Pages/login_page.dart';
import 'package:matrimonial_app/Login/Provider/user.dart';
import 'package:provider/provider.dart';

import 'Utils/page_router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const LoginPage()
        //  Provider.of<UserProvider>(context, listen: false).user.token == null
        //     ? const LoginPage()
        //     : const RegistrationPage(),
        );
  }
}
