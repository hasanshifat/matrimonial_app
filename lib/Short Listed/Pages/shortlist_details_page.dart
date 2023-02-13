import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/color_codes.dart';

class ShortListDetailsPage extends StatefulWidget {
  static const String routeName = '/shortListDetailsPage';
  const ShortListDetailsPage({super.key});

  @override
  State<ShortListDetailsPage> createState() => _ShortListDetailsPageState();
}

class _ShortListDetailsPageState extends State<ShortListDetailsPage> {
  Size? pageSize;
  bool isLoading = false;
  @override
  void initState() {
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
      ),
      body: SafeArea(
          child: isLoading == false
              ? Center(
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
                          child: Row(
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
                                      borderRadius: BorderRadius.circular(10),
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
                                      'MAF102',
                                      style: GoogleFonts.anekBangla(
                                          fontSize: 25,
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
                                  color: ColorCodes.deepGrey.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              //? Table of basic details of bride/groom
                              basicDetailsTable(),
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
                        familyDetailsTable()
                      ],
                    ),
                  ),
                )),
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
          overflow: TextOverflow.clip,
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
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Text(
          data,
          overflow: TextOverflow.clip,
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              data!,
              overflow: TextOverflow.clip,
              softWrap: true,
              style: const TextTheme().bodySmall,
            ),
          ),
        ]);
  }
}
