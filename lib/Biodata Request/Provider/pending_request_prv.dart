import 'package:flutter/material.dart';
import 'package:matrimonial_app/Biodata%20Request/Model/pending_request_model.dart';
import 'package:matrimonial_app/Biodata%20Request/Services/biodat_request_service.dart';

class PendingBiodataPrv extends ChangeNotifier {
  late List<PendingRequestModel> _list = [];
  List<PendingRequestModel> get pendingList => _list;
  bool? isLoading = false;
  bool? isScrolling = false;
  bool? isEndList = false;

  setList(List<PendingRequestModel> list) {
    if (list.isNotEmpty) {
      _list.addAll(list);
      if (_list.length < 10) {
        isEndList = true;
      }
    }
    isLoading = false;
    isScrolling = false;
    notifyListeners();
  }

  getPendingList(context, int currentPage, bool scrollingValue) async {
    //_list.clear();
    isLoading = true;
    isScrolling = scrollingValue;
    await BioDataRequestService()
        .pendingRequestService(context, '3128', currentPage)
        .then((value) => setList(value));
  }
}
