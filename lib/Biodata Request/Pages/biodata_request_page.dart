import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Common UI/submit_button.dart';
import '../../Short Listed/Pages/shortlist_details_page.dart';
import '../../Utils/color_codes.dart';
import 'biodata_details_page.dart';

class BioDataRequestPage extends StatefulWidget {
  const BioDataRequestPage({super.key});

  @override
  State<BioDataRequestPage> createState() => _BioDataRequestPageState();
}

class _BioDataRequestPageState extends State<BioDataRequestPage> {
  late List list;
  Size? pageSize;

  @override
  void initState() {
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
      ),
    );
  }

  Padding contentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, BioDataRequestDetailsPage.routeName, (route) => true,
              arguments: false);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundColor:
                            ColorCodes.primaryPurple.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Center(
                            child:
                                Image.asset('assets/images/muslim.png', //yl-bg
                                    fit: BoxFit.cover,
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
                        _tableRow('পেশা', 'প্রকৌশলী'),
                      ],
                    ),
                    // const Spacer(),
                    // CircleAvatar(
                    //   maxRadius: 18,
                    //   backgroundColor: ColorCodes.deepGrey.withOpacity(0.1),
                    //   child: const Icon(
                    //     Icons.arrow_forward,
                    //     size: 18,
                    //     color: ColorCodes.deepGrey,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    GestureDetector(
                      onTap: () => print('reject'),
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: ColorCodes.deepGrey.withOpacity(0.1),
                        child: const Icon(
                          Icons.close,
                          size: 22,
                          color: ColorCodes.deepGrey,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => print('accept'),
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: ColorCodes.purpleBlue.withOpacity(0.1),
                        child: const Icon(
                          Icons.done,
                          size: 22,
                          color: ColorCodes.purpleBlue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              // _rowBtn()
            ],
          ),
        ),
      ),
    );
  }

  _tableRow(String? title, data) {
    TextStyle txtStyle() {
      return GoogleFonts.anekBangla(
          fontSize: 12,
          color: ColorCodes.deepGrey,
          fontWeight: FontWeight.w500);
    }

    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Text(
          title!,
          style: txtStyle(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Text(
          ':',
          style: txtStyle(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Text(
          data,
          style: txtStyle(),
        ),
      ),
    ]);
  }

  _rowBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: SubmitButton(
              elevation: 2,
              borderColor: Colors.transparent,
              gradColor1: ColorCodes.purpleBlue,
              gradColor2: ColorCodes.purpleBlue,
              borderWidth: 0,
              text: "গ্রহণ করুন",
              buttonRadius: 8,
              height: 30,
              width: 200,
              fontWeight: FontWeight.w500,
              textColor: Colors.white,
              textSize: 14,
              press: (() => {})),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: SubmitButton(
              elevation: 2,
              borderColor: Colors.transparent,
              gradColor1: ColorCodes.deepGrey.withOpacity(0.5),
              gradColor2: ColorCodes.deepGrey.withOpacity(0.5),
              borderWidth: 0,
              text: "প্রত্যাখ্যান করুন",
              buttonRadius: 8,
              height: 30,
              width: 200,
              fontWeight: FontWeight.w500,
              textColor: Colors.white,
              textSize: 14,
              press: (() => {})),
        ),
      ]),
    );
  }
}
