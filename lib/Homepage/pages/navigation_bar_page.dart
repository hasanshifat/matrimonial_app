import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Homepage/pages/homepage.dart';
import 'package:badges/badges.dart' as badges;
import '../../BioData/Pages/bio_data_page.dart';
import '../../Short Listed/Pages/shortlist_page.dart';
import '../../Utils/color_codes.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  bool isHomeActive = false;
  bool isFavActive = false;
  bool isBiodataActive = false;
  bool isRequestActive = false;
  bool isProfileActive = false;
  var body;
  @override
  void initState() {
    isHomeActive = true;
    appName();
    body = const Homepage();
    super.initState();
  }

  String appName() {
    String name;
    if (isHomeActive) {
      return name = 'App Name';
    } else if (isFavActive) {
      return name = 'প্রিয় তালিকা';
    } else if (isRequestActive) {
      return name = 'অনুরোধের তালিকা';
    } else if (isProfileActive) {
      return name = 'প্রোফাইল';
    }

    return name = 'App Name';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Text(
              appName(),
              style: GoogleFonts.anekBangla(fontSize: 20, color: Colors.black),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        //height: MediaQuery.of(context).size.height * 0.08,
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  body = const Homepage();
                  isHomeActive = true;
                  appName();
                  isBiodataActive = false;
                  isFavActive = false;
                  isProfileActive = false;
                  isRequestActive = false;
                }),
                child: Image.asset(
                  'assets/images/home.png',
                  height: 25,
                  width: 25,
                  color: isHomeActive == true
                      ? ColorCodes.primaryPink
                      : ColorCodes.deepGrey,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  body = const ShortListPage();
                  isHomeActive = false;
                  isBiodataActive = false;
                  isFavActive = true;
                  appName();
                  isProfileActive = false;
                  isRequestActive = false;
                }),
                child: Image.asset(
                  'assets/images/favorites.png',
                  height: 25,
                  width: 25,
                  color: isFavActive == true
                      ? ColorCodes.primaryPink
                      : ColorCodes.deepGrey,
                ),
              ),
              GestureDetector(
                  onTap: () => setState(() {
                        body = const ShortListPage();
                        isHomeActive = false;
                        isBiodataActive = false;
                        isFavActive = false;
                        isProfileActive = false;
                        isRequestActive = true;
                      }),
                  child: Image.asset(
                    'assets/images/request.png',
                    height: 25,
                    width: 25,
                    color: isRequestActive == true
                        ? ColorCodes.primaryPink
                        : ColorCodes.deepGrey,
                  )),
              GestureDetector(
                onTap: () => setState(() {
                  body = const BioDataPage();
                  isHomeActive = false;
                  isBiodataActive = true;
                  appName();
                  isFavActive = false;
                  isProfileActive = false;
                  isRequestActive = false;
                }),
                child: Image.asset(
                  'assets/images/mybiodata.png',
                  height: 25,
                  width: 25,
                  color: isBiodataActive == true
                      ? ColorCodes.primaryPink
                      : ColorCodes.deepGrey,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  body = const ShortListPage();
                  isHomeActive = false;
                  isBiodataActive = false;
                  isFavActive = false;
                  isProfileActive = true;
                  appName();
                  isRequestActive = false;
                }),
                child: Image.asset(
                  'assets/images/user.png',
                  height: 25,
                  width: 25,
                  color: isProfileActive == true
                      ? ColorCodes.primaryPink
                      : ColorCodes.deepGrey,
                ),
              ),
            ],
          ),
        ),
      )),
      body: SafeArea(child: body),
    );
  }

  badges.Badge notificationWidget() {
    return badges.Badge(
      badgeContent: Text(
        '3',
        style: GoogleFonts.anekBangla(fontSize: 14, color: Colors.white),
      ),
      badgeStyle: const badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: ColorCodes.seconderyStrongPink,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        elevation: 0,
      ),
      child: Image.asset(
        'assets/images/bell.png',
        height: 25,
        width: 25,
        color: isRequestActive == true
            ? ColorCodes.primaryPink
            : ColorCodes.deepGrey,
      ),
    );
  }
}
