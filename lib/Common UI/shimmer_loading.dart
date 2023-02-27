import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/color_codes.dart';

class ShimmerLoading {
  Widget shimmerList(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: double.infinity,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            contentWidget(),
            contentWidget(),
            contentWidget(),
          ],
        ),
      )),
    );
  }

  Padding contentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () async {},
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
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        direction: ShimmerDirection.ltr,
                        period: const Duration(seconds: 1),
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundColor:
                              ColorCodes.primaryPurple.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Center(
                              child: Image.asset(
                                  'assets/images/muslim.png', //yl-bg
                                  fit: BoxFit.cover,
                                  color: ColorCodes.deepGrey),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                    Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: [
                        TableRow(children: [
                          fakeTextBox(),
                        ]),
                        TableRow(children: [
                          fakeTextBox(),
                        ]),
                        TableRow(children: [
                          fakeTextBox(),
                        ]),
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
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: ColorCodes.deepGrey.withOpacity(0.1),
                      direction: ShimmerDirection.ltr,
                      period: const Duration(seconds: 1),
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
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey,
                      direction: ShimmerDirection.ltr,
                      period: const Duration(seconds: 1),
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: ColorCodes.purpleBlue.withOpacity(0.1),
                        child: const Icon(
                          Icons.done,
                          size: 22,
                          color: ColorCodes.deepGrey,
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

  Shimmer fakeTextBox() {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: ColorCodes.deepGrey.withOpacity(0.1),
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 1),
        child: CircleAvatar(
          maxRadius: 20,
          backgroundColor: ColorCodes.deepGrey.withOpacity(0.8),
          child: Container(
            width: 200,
            height: 10,
          ),
        ));
  }
}
