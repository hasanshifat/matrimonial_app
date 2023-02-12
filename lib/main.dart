import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrimonial_app/Homepage/pages/homepage.dart';
import 'package:matrimonial_app/Homepage/pages/navigation_bar_page.dart';
import 'package:matrimonial_app/Login/Pages/login_page.dart';
import 'package:matrimonial_app/Login/Provider/user.dart';
import 'package:provider/provider.dart';

import 'SignUp/Pages/registration_page.dart';
import 'Utils/page_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const LoginPage()
        //  Provider.of<UserProvider>(context, listen: false).user.token == null
        //     ? const LoginPage()
        //     : const RegistrationPage(),
        );
  }
}
