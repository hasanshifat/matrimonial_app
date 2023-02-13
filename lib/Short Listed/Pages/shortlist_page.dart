import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:matrimonial_app/Common%20UI/outline_button.dart';
import 'package:matrimonial_app/Short%20Listed/Hive/short_listed_class.dart';
import 'package:matrimonial_app/Short%20Listed/Pages/shortlist_details_page.dart';

import '../../Common UI/submit_button.dart';
import '../../Utils/color_codes.dart';

class ShortListPage extends StatefulWidget {
  static const String routeName = '/shortListPage';
  const ShortListPage({super.key});

  @override
  State<ShortListPage> createState() => _ShortListPageState();
}

class _ShortListPageState extends State<ShortListPage> {
  late List list;
  Size? pageSize;
  late Box box;
  @override
  void initState() {
    boxInitialixation();
    list = [
      contentWidget(),
      contentWidget(),
      contentWidget(),
      contentWidget(),
      contentWidget(),
      contentWidget(),
      contentWidget(),
      contentWidget(),
    ];
    super.initState();
  }

  Future boxInitialixation() async {
    box = await Hive.openBox('box');
    box.put('shortListClass', ShortListedClass(biodataID: 200));
  }

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: list.map((e) => contentWidget()).toList(),
        ),
      ),
    ));
  }

  Padding contentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            ShortListDetailsPage.routeName,
            (route) => true,
          );
          ShortListedClass shortListedClass = box.get('shortListClass');
          print('Box: ${shortListedClass.biodataID}');
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: ColorCodes.primaryPurple.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Center(
                        child: Image.asset('assets/images/muslim.png',
                            color: ColorCodes.purpleBlue),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: VerticalDivider(
                    width: 0.5,
                    thickness: .5,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Table(
                  defaultColumnWidth: const IntrinsicColumnWidth(),
                  // border: TableBorder(
                  //     horizontalInside: BorderSide(
                  //         width: 0.8,
                  //         color: Colors.grey.shade100,
                  //         style: BorderStyle.solid)
                  //         ),
                  children: [
                    // _tableRow('জন্ম সাল', '1996'),
                    _tableRow('বৈবাহিক অবস্থা', 'অবিবাহিত'),
                    _tableRow('বায়োডাটা নম্বর', 'MAF102'),
                    _tableRow('পেশা', 'প্রকৌশলী')
                  ],
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => deletionDialog(context),
                        child: Icon(
                          Icons.delete,
                          color: ColorCodes.softRed.withOpacity(1),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: ColorCodes.deepGrey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _tableRow(String? title, data) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Text(
          title!,
          style: const TextTheme().bodySmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Text(
          ':',
          style: const TextTheme().bodySmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Text(
          data,
          style: const TextTheme().bodySmall,
        ),
      ),
    ]);
  }

  deletionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: ((context) => StatefulBuilder(
            builder: ((context, setState) => Dialog(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Text(
                              'সতর্কতা',
                              style: GoogleFonts.anekBangla(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: ColorCodes.softRed),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'আপনি কি ',
                                style: GoogleFonts.anekBangla(
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'MAF102',
                                style: GoogleFonts.anekBangla(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' বায়োডাটা মুছে ফেলতে চান?',
                                style: GoogleFonts.anekBangla(
                                    fontSize: 14,
                                    color: ColorCodes.deepGrey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ])),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutLineButton(
                                  elevation: 2,
                                  borderColor:
                                      ColorCodes.deepGrey.withOpacity(0.8),
                                  color: Colors.white,
                                  borderWidth: 0,
                                  text: "হ্যাঁ",
                                  buttonRadius: 10,
                                  height: 30,
                                  width: pageSize!.width * 0.35,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorCodes.deepRed,
                                  textSize: 16,
                                  press: (() => null)),
                              OutLineButton(
                                  elevation: 2,
                                  borderColor:
                                      ColorCodes.deepGrey.withOpacity(0.8),
                                  color: Colors.white,
                                  borderWidth: 0,
                                  text: "না",
                                  buttonRadius: 10,
                                  height: 30,
                                  width: pageSize!.width * 0.35,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorCodes.deepGreen,
                                  textSize: 16,
                                  press: (() => Navigator.of(context).pop())),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )))));
  }
}
