// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimonial_app/Constants/url.dart';
import 'package:matrimonial_app/Utils/auth_class.dart';
import 'package:provider/provider.dart';
import '../../Utils/date_formation.dart';
import '../../Utils/error_handles.dart';
import '../Model/pending_request_model.dart';
import '../Provider/pending_request_prv.dart';

class BioDataRequestService {
  var date = DateTime.now();
  Future<List<PendingRequestModel>> pendingRequestService(
      BuildContext context, String userId, int currentPage) async {
    print('currentPage: $currentPage');

    try {
      http.Response res = await http.get(
        Uri.parse(
            '${ApiURL.baseLink}/app/get_pending_request/$userId?page=$currentPage'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': BasicAuth().basicAuth
        },
      );

      Map<String, dynamic> map = jsonDecode(utf8.decode(res.bodyBytes));
      List<dynamic> data = map["items"];
      List<PendingRequestModel> l =
          pendingRequestModelFromJson(jsonEncode(data));
      return l;
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

  acceptRejectionService(
      BuildContext context, String? status, int? rbid, int? index) async {
    print('BID: $rbid');
    String? nowDate;
    await DateFormation()
        .dateFormat(context, date.toString())
        .then((value) => nowDate = value.toString());
    Map data = {
      "STATUS": "$status",
      "ACTION_TIME": "${nowDate}T${date.hour}:${date.minute}:${date.second}Z",
      "REMARKS_OF_REJECTION": "Test"
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
      print('Body: ${res.statusCode}');
      if (res.statusCode == 200) {
        final pendingBiodataPrv =
            Provider.of<PendingBiodataPrv>(context, listen: false);
        pendingBiodataPrv.pendingList.removeWhere((item) => item.rbId == index);
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
