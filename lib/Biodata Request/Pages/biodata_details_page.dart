import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../Common UI/loading_diaalogs.dart';
import '../../Common UI/outline_button.dart';
import '../../Common UI/submit_button.dart';
import '../../Constants/url.dart';
import '../../Utils/auth_class.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/date_formation.dart';
import 'package:http/http.dart' as http;

import '../Model/pending_request_model.dart';
import '../Provider/pending_request_prv.dart';

class BioDataRequestDetailsPage extends StatefulWidget {
  static const String routeName = '/BioDataRequestDetailsPage';
  // final bool isAccepted;
  final PendingRequestModel p;
  final int listIndex;

  const BioDataRequestDetailsPage(
      {super.key,
      // required this.isAccepted,
      required this.p,
      required this.listIndex});

  @override
  State<BioDataRequestDetailsPage> createState() =>
      _BioDataRequestDetailsPageState();
}

class _BioDataRequestDetailsPageState extends State<BioDataRequestDetailsPage> {
  Size? pageSize;
  bool isLoading = false;
  bool isRead = false;
  bool isRequestSend = false;
  var date = DateTime.now();
  late PendingBiodataPrv pendingBiodataPrv;
  @override
  void initState() {
    pendingBiodataPrv = Provider.of<PendingBiodataPrv>(context, listen: false);
    delayed();
    super.initState();
  }

  Future delayed() async {
    await Future.delayed(const Duration(seconds: 1), (() {
      setState(() {
        isLoading = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'বিস্তারিত',
          style: const TextTheme().labelLarge,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () async => await Share.share(
                  'check out my website https://example.com',
                  subject: 'Share'),
              child: const Icon(
                Icons.share,
                color: ColorCodes.purpleBlue,
                size: 20,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: isLoading == false
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Image.asset(
                                              'assets/images/muslim.png', //yl-bg
                                              width: pageSize!.height * 0.13,
                                              height: pageSize!.height * 0.16,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'BM${widget.p.biodataNo}',
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 20,
                                              color: ColorCodes.deepGrey
                                                  .withOpacity(0.8),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: VerticalDivider(
                                      width: 0.5,
                                      thickness: .5,
                                      color:
                                          ColorCodes.deepGrey.withOpacity(0.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  //? Table of basic details of bride/groom
                                  basicDetailsTable(),
                                ],
                              ),
                              isRequestSend ? const SizedBox() : _rowBtn()
                            ],
                          ),
                        ),
                        const Divider(),
                        Text(
                          'ঠিকানা',
                          style: GoogleFonts.anekBangla(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: ColorCodes.purpleBlue),
                        ),

                        //? Table of Address details of bride/groom
                        addressDetailsTable(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'শিক্ষাগত বিবরণ',
                          style: GoogleFonts.anekBangla(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: ColorCodes.purpleBlue),
                        ),
                        //? Table of Family  details of bride/groom
                        educationalDetaisTable(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'পারিবারিক বিবরণ',
                          style: GoogleFonts.anekBangla(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: ColorCodes.purpleBlue),
                        ),
                        //? Table of Educational  details of bride/groom
                        familyDetailsTable(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )),
    );
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
              press: (() async => {
                    CustomLoadingDialogs.circleProgressLoading(context),
                    await acceptRejectionService(
                        "A", widget.p.rbId, widget.listIndex),
                  })),
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
              press: (() async => {
                    CustomLoadingDialogs.circleProgressLoading(context),
                    await acceptRejectionService(
                        "R", widget.p.rbId, widget.listIndex),
                  })),
        ),
      ]),
    );
  }

  ClipRRect educationalDetaisTable() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorCodes.deepGrey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder(
              borderRadius: BorderRadius.circular(8),
              // top: tableBorderDesign(),
              // left: tableBorderDesign(),
              // right: tableBorderDesign(),
              // bottom: tableBorderDesign(),
              horizontalInside: tableBorderDesign()),
          children: [
            _tableRowWithpadding('আপনার শিক্ষা মাধ্যম', 'জেনারেল', 0),
            _tableRowWithpadding('পাসের সন', '২০০৯', 1),
            _tableRowWithpadding('বিভাগ', 'মানবিক বিভাগ', 2),
            _tableRowWithpadding('স্নাতক (সম্মান)/বিষয়', 'ইসলামের ইতিহাস', 3),
            _tableRowWithpadding('ফলাফল', 'A+', 4),
            _tableRowWithpadding(
                'শিক্ষাপ্রতিষ্ঠানের নাম', 'কবি নজরুল সরকারি কলেজ', 5),
            _tableRowWithpadding(
                'অন্যান্য শিক্ষাগত যোগ্যতা',
                'ডিপ্লোমা ইন হোমিওপ্যাথিক মেডিসিন এন্ড সার্জারী। পাসের সন-২০১৫ বাংলাদেশ হোমিওপ্যাথিক মেডিকেল কলেজ এন্ড হসপিটাল, ঢাকা।',
                6),
          ],
        ),
      ),
    );
  }

  ClipRRect addressDetailsTable() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorCodes.deepGrey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder(
              borderRadius: BorderRadius.circular(8),
              horizontalInside: tableBorderDesign()),
          children: [
            _tableRowWithpadding('স্থায়ী ঠিকানা',
                'শ্রীনগর, মুন্সিগঞ্জ, ঢাকা,শ্রীনগর, মুন্সিগঞ্জ, ঢাকা', 0),
            _tableRowWithpadding(
                'বর্তমান ঠিকানা', 'শ্রীনগর, মুন্সিগঞ্জ, ঢাকা, শ্রীনগর', 1),
            _tableRowWithpadding('কোথায় বড় হয়েছেন?', 'ঢাকা', 2),
          ],
        ),
      ),
    );
  }

  ClipRRect familyDetailsTable() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorCodes.deepGrey.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder(
              borderRadius: BorderRadius.circular(8),
              horizontalInside: tableBorderDesign()),
          children: [
            _tableRowWithpadding('আপনার পিতা কি জীবিত?', 'না, মৃত', 0),
            _tableRowWithpadding(
                'পিতার পেশা',
                'সরকারি চাকুরিজীবী ছিলেন, যামিলি প্লানিং,ইন্সপেক্টর (FPI)পদে নিয়োজিত ছিলেন।',
                1),
            _tableRowWithpadding('আপনার মাতা কি জীবিত?', 'না, মৃত', 2),
            _tableRowWithpadding('মাতার পেশার বিবরণ',
                'সরকারি চাকুরিজীবী ছিলেন, ফ্যামিলি প্লানিং।', 3),
            _tableRowWithpadding('ভাই আছে?', 'ভাই নেই', 4),
            _tableRowWithpadding('বোন আছে?', '৭', 5),
            _tableRowWithpadding(
                'ভাইদের তথ্য',
                'বড় বোন-টেস্ট পরিক্ষা দিয়েছেন, পরে আর এস এস সি দেন নি,ডিভোর্সি, বর্তমানে ব্যাবসায়ী',
                6),
            _tableRowWithpadding(
                'চাচা/মামাদের তথ্য',
                'বড় বোন-টেস্ট পরিক্ষা দিয়েছেন, পরে আর এস এস সি দেন নি,ডিভোর্সি, বর্তমানে ব্যাবসায়ী',
                7),
            _tableRowWithpadding('অর্থনৈতিক অবস্থা', 'মধ্যবিত্ত', 8),
          ],
        ),
      ),
    );
  }

  BorderSide tableBorderDesign() {
    return BorderSide(
        width: 0.5,
        color: ColorCodes.deepGrey.withOpacity(0.5),
        style: BorderStyle.solid,
        strokeAlign: StrokeAlign.outside);
  }

  Table basicDetailsTable() {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      // border: TableBorder(
      //     horizontalInside: BorderSide(
      //         width: 0.8,
      //         color: Colors.grey.shade100,
      //         style: BorderStyle.solid)
      //         ),
      children: [
        _tableRow('বায়োডাটার ধরন', 'কনের'),
        _tableRow('জন্ম সাল', '1996'),
        _tableRow('বৈবাহিক অবস্থা', 'অবিবাহিত'),
        _tableRow('পেশা', 'বেসরকারি কর্মচারী'),
        _tableRow('উচ্চতা', '৪′ ১১″'),
        _tableRow('গাত্রবর্ণ', 'উজ্জ্বল শ্যামলা'),
        _tableRow('ওজন', '৭৩ কেজি'),
        _tableRow('রক্তের গ্রুপ', 'O+'),
      ],
    );
  }

  _tableRow(String? title, data) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Text(
          title!,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextTheme().bodySmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Text(
          ' : ',
          style: const TextTheme().bodySmall,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Text(
          data,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextTheme().bodySmall,
        ),
      ),
    ]);
  }

  _tableRowWithpadding(String? title, String? data, int index) {
    return TableRow(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: index.isEven ? Colors.grey.shade100 : Colors.white),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Text(
              title!,
              overflow: TextOverflow.clip,
              softWrap: true,
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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Text(
              data!,
              overflow: TextOverflow.clip,
              softWrap: true,
              style: const TextTheme().bodySmall,
            ),
          ),
        ]);
  }

  requestConfirmationDialog(BuildContext context) {
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
                          Table(
                            defaultColumnWidth: const IntrinsicColumnWidth(),
                            children: [
                              _tableRow('বায়োডাটার ধরন', 'কনের'),
                              _tableRow('বায়োডাটা নম্বর', 'MAF102'),
                              // _tableRow('মোট সংযোগ', '10'),
                              _tableRow('সংযোগ বাকি আছে', '6'),
                              _tableRow('সংযোগ খরচ হবে', '1'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                  value: isRead,
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(
                                      ColorCodes.purpleBlue),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  onChanged: ((value) {
                                    setState(
                                      () {
                                        isRead = value!;
                                      },
                                    );
                                  })),
                              Text(
                                'আমি মনোযোগ সহকারে সমস্ত তথ্য পড়েছি।',
                                style: GoogleFonts.anekBangla(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: ColorCodes.softRed),
                              ),
                            ],
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
                                  color: !isRead
                                      ? Colors.grey.shade100
                                      : Colors.white,
                                  borderWidth: 0,
                                  text: "নিশ্চিত করুন",
                                  buttonRadius: 8,
                                  height: 30,
                                  width: pageSize!.width * 0.35,
                                  fontWeight: FontWeight.w500,
                                  textColor: !isRead
                                      ? Colors.grey
                                      : ColorCodes.deepGreen,
                                  textSize: 14,
                                  press: isRead ? null : (() => null)),
                              OutLineButton(
                                  elevation: 2,
                                  borderColor:
                                      ColorCodes.deepGrey.withOpacity(0.8),
                                  color: Colors.white,
                                  borderWidth: 0,
                                  text: "বাতিল করুন",
                                  buttonRadius: 8,
                                  height: 30,
                                  width: pageSize!.width * 0.35,
                                  fontWeight: FontWeight.w500,
                                  textColor: ColorCodes.softRed,
                                  textSize: 14,
                                  press: (() => Navigator.of(context).pop())),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )))));
  }

  //! Http Request
  Future acceptRejectionService(String? status, int? rbid, int? index) async {
    print('BID: $rbid');
    String? nowDate;
    await DateFormation()
        .dateFormat(context, date.toString())
        .then((value) => nowDate = value.toString());
    Map data = {
      "STATUS": "$status",
      "ACTION_TIME": "${nowDate}T${date.hour}:${date.minute}:${date.second}Z",
      "REMARKS_OF_REJECTION": ""
    };
    try {
      http.Response res = await http.put(
        Uri.parse('${ApiURL.baseLink}/app/request_accept_reject/$rbid'),
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': BasicAuth().basicAuth
        },
      );
      if (res.statusCode == 200) {
        setState(() {
          isRequestSend = true;
          pendingBiodataPrv.pendingList
              .removeWhere((item) => item.rbId == rbid);
          Navigator.pop(context);
        });
      }
    } catch (e) {
      print(e);
      // CustomSnackBars().showSnackBar(
      //   context,
      //   e.toString(),
      //   ColorCodes.softRed,
      // );
      return List.empty();
    }
  }
}
