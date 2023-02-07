import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingDialogs {
  static circleProgressLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: ((context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Dialog(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Lottie.asset(
                        'assets/lottie/loading_ring_medium.json',
                        width: 100,
                        height: 100),
                  ),
                ),
              ),
            )));
  }
}
