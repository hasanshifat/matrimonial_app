import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matrimonial_app/Homepage/pages/navigation_bar_page.dart';
import 'package:matrimonial_app/Login/Pages/login_page.dart';
import 'package:matrimonial_app/Login/Provider/user.dart';
import 'package:provider/provider.dart';
import 'Short Listed/Hive/short_listed_class.dart';
import 'Utils/color_codes.dart';
import 'Utils/page_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  Hive.registerAdapter(ShortListedClassAdapter());
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
        theme: ThemeData(
            textTheme: TextTheme(
                headlineLarge: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color: ColorCodes.deepGrey),
                labelLarge: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorCodes.deepGrey),
                bodySmall: GoogleFonts.anekBangla(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorCodes.deepGrey),
                bodyMedium: GoogleFonts.anekBangla(
                    fontSize: 14,
                    color: ColorCodes.deepGrey,
                    fontWeight: FontWeight.w500)),
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                color: Colors.white,
                titleTextStyle: GoogleFonts.anekBangla(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorCodes.deepGrey),
                surfaceTintColor: Colors.white,
                systemOverlayStyle: const SystemUiOverlayStyle(
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
