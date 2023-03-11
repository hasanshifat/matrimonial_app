import 'package:flutter/material.dart';
import 'package:matrimonial_app/Login/Provider/user.dart';
import 'package:matrimonial_app/Utils/other_utils.dart';
import 'package:provider/provider.dart';

import '../../Utils/color_codes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Size? pageSize;
  @override
  Widget build(BuildContext context) {
    pageSize = MediaQuery.of(context).size;
    return Consumer<UserProvider>(builder: (context, value, child) {
      return SizedBox(
        height: pageSize!.height * 1,
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: pageSize!.width * 0.4,
                    width: pageSize!.width * 0.4,
                    // color: ColorCodes.softGreen.withOpacity(0.1),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          maxRadius: 80,
                          backgroundColor:
                              ColorCodes.primaryPurple.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Center(
                              child: Image.asset('assets/images/muslim.png',
                                  color: ColorCodes.purpleBlue),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () => print('object'),
                            child: const CircleAvatar(
                              backgroundColor: ColorCodes.purpleBlue,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Text(value.uList[0].userName),
                OtherUtils.height5,
                tileBtn('প্রোফাইল এডিট করুন', Icons.edit_sharp),
                tileBtn('পেমেন্ট হিস্ট্রি', Icons.history),
              ],
            ),
          ),
        ),
      );
    });
  }

  Padding tileBtn(
    String btnName,
    IconData icons,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorCodes.deepGrey.withOpacity(0.2))),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          style: ListTileStyle.drawer,
          leading: CircleAvatar(
            backgroundColor: ColorCodes.primaryPink,
            child: Icon(
              icons,
              color: Colors.white,
            ),
          ),
          title: Text(
            btnName,
            style: const TextTheme().bodySmall,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: ColorCodes.deepGrey,
          ),
        ),
      ),
    );
  }
}
