import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrimonial_app/Biodata%20Request/Services/biodat_request_service.dart';
import 'package:matrimonial_app/Common%20UI/loading_diaalogs.dart';
import 'package:matrimonial_app/Common%20UI/shimmer_loading.dart';
import 'package:matrimonial_app/Utils/snackbars.dart';
import 'package:provider/provider.dart';

import '../../Common UI/submit_button.dart';
import '../../Constants/url.dart';
import '../../Short Listed/Pages/shortlist_details_page.dart';
import '../../Utils/auth_class.dart';
import '../../Utils/color_codes.dart';
import '../../Utils/date_formation.dart';
import '../Model/pending_request_model.dart';
import '../Provider/pending_request_prv.dart';
import 'biodata_details_page.dart';
import 'package:http/http.dart' as http;

class BioDataRequestPage extends StatefulWidget {
  const BioDataRequestPage({super.key});

  @override
  State<BioDataRequestPage> createState() => _BioDataRequestPageState();
}

class _BioDataRequestPageState extends State<BioDataRequestPage> {
  Size? pageSize;
  late PendingBiodataPrv pendingBiodataPrv;
  int currentPage = 0;
  final scrollController = ScrollController();
  var date = DateTime.now();
  @override
  void initState() {
    pendingBiodataPrv = Provider.of<PendingBiodataPrv>(context, listen: false);
    // pendingBiodataPrv.getPendingList(context, currentPage);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        setState(() {
          if (pendingBiodataPrv.isEndList == false) {
            currentPage = currentPage + 1;
            pendingBiodataPrv.getPendingList(context, currentPage, true);
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return Consumer<PendingBiodataPrv>(builder: (context, value, child) {
      return SafeArea(
          child: value.isLoading == true && value.isScrolling == false
              ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorCodes.primaryPink,
                  ),
                )
              : value.pendingList.isEmpty
                  ? Center(
                      child: Text(
                        "কোন তথ্য পাওয়া যায়নি!",
                        style: GoogleFonts.anekBangla(
                            fontWeight: FontWeight.w500,
                            color: ColorCodes.deepGrey,
                            fontSize: 14,
                            decoration: TextDecoration.none),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: value.pendingList
                                  .map((e) => contentWidget(
                                      e, value.pendingList.indexOf(e)))
                                  .toList(),
                            ),
                            value.isScrolling == true &&
                                    value.isEndList == false
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorCodes.primaryPink,
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ));
    });
  }

  Padding contentWidget(PendingRequestModel p, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      BioDataRequestDetailsPage(p: p, listIndex: i))));

          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   BioDataRequestDetailsPage.routeName,
          //   (route) => true,
          //   arguments: {true, p, i},
          // );
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
                          vertical: 10, horizontal: 5),
                      child: CircleAvatar(
                        maxRadius: 25,
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
                      children: [
                        // _tableRow('জন্ম সাল', '1996'),
                        _tableRow('বৈবাহিক অবস্থা', '${p.maritialStatus}'),
                        _tableRow('বায়োডাটা নম্বর', '$i:${p.biodataNo}'),
                        _tableRow('পেশা', '${p.profsnType}'),
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
                      onTap: () async {
                        CustomLoadingDialogs.circleProgressLoading(context);
                        await acceptRejectionService("R", p.rbId, i);
                      },
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: ColorCodes.softRed.withOpacity(0.1),
                        child: const Icon(
                          Icons.close,
                          size: 22,
                          color: ColorCodes.softRed,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        CustomLoadingDialogs.circleProgressLoading(context);
                        await acceptRejectionService("A", p.rbId, i);
                      },
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
          fontSize: 10,
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
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Text(
          ' : ',
          style: txtStyle(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: SizedBox(
          width: 70,
          child: Text(
            data,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: txtStyle(),
          ),
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
