import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/BioData/Pages/bio_data_page.dart';
import 'package:matrimonial_app/Homepage/pages/homepage.dart';
import 'package:matrimonial_app/Homepage/pages/profile.dart';
import 'package:badges/badges.dart' as badges;
import '../../Short Listed/Pages/shortlist_page.dart';
import '../../Utils/color_codes.dart';
import 'biodata.dart';
import 'favpage.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  bool isHomeActive = false;
  bool isFavActive = false;
  bool isBiodataActive = false;
  bool isNotificationActive = false;
  bool isProfileActive = false;
  var body;
  @override
  void initState() {
    isHomeActive = true;
    body = const Homepage();
    super.initState();
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
              'App name',
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
              InkWell(
                onTap: () => setState(() {
                  body = const Homepage();
                  isHomeActive = true;
                  isBiodataActive = false;
                  isFavActive = false;
                  isProfileActive = false;
                  isNotificationActive = false;
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
              InkWell(
                onTap: () => setState(() {
                  body = const ShortListPage();
                  isHomeActive = false;
                  isBiodataActive = false;
                  isFavActive = true;
                  isProfileActive = false;
                  isNotificationActive = false;
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
              InkWell(
                onTap: () => setState(() {
                  body = const BioDataPage();
                  isHomeActive = false;
                  isBiodataActive = true;
                  isFavActive = false;
                  isProfileActive = false;
                  isNotificationActive = false;
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
              InkWell(
                  onTap: () => setState(() {
                        body = const Profile();
                        isHomeActive = false;
                        isBiodataActive = false;
                        isFavActive = false;
                        isProfileActive = false;
                        isNotificationActive = true;
                      }),
                  child: Image.asset(
                    'assets/images/bell.png',
                    height: 25,
                    width: 25,
                    color: isNotificationActive == true
                        ? ColorCodes.primaryPink
                        : ColorCodes.deepGrey,
                  )),
              InkWell(
                onTap: () => setState(() {
                  body = const Profile();
                  isHomeActive = false;
                  isBiodataActive = false;
                  isFavActive = false;
                  isProfileActive = true;
                  isNotificationActive = false;
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
        color: isNotificationActive == true
            ? ColorCodes.primaryPink
            : ColorCodes.deepGrey,
      ),
    );
  }
}
