import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingDialogs {
  static circleProggressLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: ((context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset('assets/lottie/loading_ring_medium.json'),
                ),
              ),
            )));
  }
}
