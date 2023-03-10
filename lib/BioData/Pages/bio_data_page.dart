import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/BioData/Pages/address_page.dart';
import 'package:matrimonial_app/BioData/Pages/commitment_page.dart';
import 'package:matrimonial_app/BioData/Pages/contact_info_page.dart';
import 'package:matrimonial_app/BioData/Pages/educational_info_page.dart';
import 'package:matrimonial_app/BioData/Pages/family_info_page.dart';
import 'package:matrimonial_app/BioData/Pages/general_info_page.dart';
import 'package:matrimonial_app/BioData/Pages/marriage_info_page.dart';
import 'package:matrimonial_app/BioData/Pages/personal_info.dart';
import 'package:matrimonial_app/BioData/Pages/professional_info.dart';
import 'package:matrimonial_app/BioData/Pages/spouse_info_page.dart';

import '../../Utils/color_codes.dart';

class BioDataPage extends StatefulWidget {
  static const String routeName = '/bioDataPage';
  const BioDataPage({super.key});

  @override
  State<BioDataPage> createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage>
    with TickerProviderStateMixin {
  Widget textField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: ColorCodes.deepGrey.withOpacity(0.5), width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "dd/mm/yyyy",
          ),
        ),
      ),
    );
  }

  Size? pageSize;

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              elevation: 0,
              // backgroundColor: Colors.amberAccent,
              bottom: TabBar(
                  indicatorColor: ColorCodes.primaryPink,
                  isScrollable: true,
                  labelColor: ColorCodes.deepGrey,
                  labelStyle: tabBarLebelTextStyle(),
                  unselectedLabelStyle: unselectedLabelStyle(),
                  tabs: const [
                    Text(
                      "?????????????????? ????????????",
                    ),
                    Text(
                      "??????????????????",
                    ),
                    Text(
                      "??????????????????",
                    ),
                    Text(
                      "??????????????????????????? ????????????",
                    ),
                    Text(
                      "??????????????????????????? ????????????",
                    ),
                    Text(
                      "?????????????????? ????????????",
                    ),
                    Text(
                      "??????????????? ??????????????????????????? ????????????",
                    ),
                    Text(
                      "?????????????????????????????? ???????????????????????????",
                    ),
                    Text(
                      "????????????????????????????????????",
                    ),
                    Text(
                      "?????????????????????",
                    ),
                  ]),
            )),
        body: const SafeArea(
          child: TabBarView(
            children: [
              GeneralInfoPage(),
              Addresspage(),
              EducationalInfoPage(),
              FamilyInfo(),
              PersonalInfoPage(),
              ProfessionalInfoPage(),
              MarriageInfoPage(),
              SpouseInfoPage(),
              CommitmentPage(),
              ContactInfoPage(),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle unselectedLabelStyle() {
    return GoogleFonts.anekBangla(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorCodes.deepGrey.withOpacity(0.5));
  }

  TextStyle tabBarLebelTextStyle() {
    return GoogleFonts.anekBangla(
        fontWeight: FontWeight.w500, fontSize: 16, color: ColorCodes.deepGrey);
  }
}
