import 'package:flutter/material.dart';
import 'package:matrimonial_app/Utils/color_codes.dart';

class FabricLagbe extends StatefulWidget {
  const FabricLagbe({Key? key}) : super(key: key);

  @override
  State<FabricLagbe> createState() => _FabricLagbeState();
}

class _FabricLagbeState extends State<FabricLagbe> {
  String currentImage = 'assets/images/image1.jpg';
  late List<ImagesClass> cloothesImages;
  late List<SizeClass> sizeList;
  late List<ColorChoice> colorList;

  @override
  void initState() {
    cloothesImages = [
      ImagesClass(
        title: 'image 1',
        image: "assets/images/image1.jpg",
      ),
      ImagesClass(
        title: 'image 2',
        image: "assets/images/image2.jpg",
      ),
      ImagesClass(
        title: 'image 3',
        image: "assets/images/image3.jpg",
      ),
      ImagesClass(
        title: 'image 4',
        image: "assets/images/image4.jpg",
      ),
      ImagesClass(
        title: 'image 1',
        image: "assets/images/image1.jpg",
      ),
    ];
    sizeList = [
      SizeClass(size: 'S', value: 10),
      SizeClass(size: 'M', value: 20),
      SizeClass(size: 'L', value: 30),
      SizeClass(size: 'XL', value: 40),
      SizeClass(size: '2XL', value: 50),
      SizeClass(size: '3XL', value: 60),
    ];
    colorList = [
      ColorChoice(name: 'Red', color: Colors.red),
      ColorChoice(name: 'Blue', color: Colors.blue),
      ColorChoice(name: 'White', color: Colors.white),
      ColorChoice(name: 'Black', color: Colors.black),
      ColorChoice(name: 'Orange', color: Colors.orange)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Product Details"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.green, Colors.green.shade100],
              stops: const [
                1,
                0.2,
              ],
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Center(child: Text('BDT')),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Center(child: Text('EN')),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  currentImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              cloothesImages.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : imageList(),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Product Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Entry Time",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "(6 October 2022 10:00PM)",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    "Share",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.share,
                    size: 18,
                    color: ColorCodes.primaryPink,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.phone,
                    size: 18,
                    color: ColorCodes.primaryPurple,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Poplin Finish Fabric",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Seller Name  |  Related more product",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Ratings  |  Reviews",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Quantity: 200 Yards",
                style: TextStyle(fontSize: 12),
              ),
              Row(
                textBaseline: TextBaseline.ideographic,
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: const [
                  Text(
                    "Unit Price: ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "555 ৳",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ],
              ),
              Row(
                textBaseline: TextBaseline.ideographic,
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: const [
                  Text(
                    "Total Price: ",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "123,555 ৳",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Size",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              sizeChoice(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Color",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              colorChoice(),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Customization: Logo (Min 500 Pcs)",
                style: TextStyle(fontSize: 12),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Simple Button"),
                      ),
                    );
                  }),
                  child: const Text("View Details")),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Price and Delivery Time According to",
                style: TextStyle(fontSize: 12),
              ),
              const Text(
                "the Amount:",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              quantity(),
              price(),
              deliveryTime(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      onPressed: (() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Simple Button"),
                          ),
                        );
                      }),
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          children: const [
                            Icon(Icons.shopping_cart),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Full Bid"),
                          ],
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue)),
                      onPressed: (() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Simple Button"),
                          ),
                        );
                      }),
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          children: const [
                            Icon(Icons.send),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Partial Bid"),
                          ],
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                defaultColumnWidth: const IntrinsicColumnWidth(),
                // border: TableBorder(
                //     horizontalInside: BorderSide(
                //         width: 0.8,
                //         color: Colors.grey.shade100,
                //         style: BorderStyle.solid)
                //         ),
                children: [
                  _tableRow('Quantity', '123'),
                  _tableRow('Bid Price Unit (BDT)', '123'),
                  _tableRow('Bid Price Total (BDT)', '123,64'),
                  _tableRow('Bid Price Unit (BDT)', '123'),
                  _tableRow('Bid Price Unit (BDT)', '454,398'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: (() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Simple Button"),
                          ),
                        );
                      }),
                      child: const SizedBox(
                        width: 100,
                        child: Center(child: Text("Buy Now")),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      onPressed: (() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Simple Button"),
                          ),
                        );
                      }),
                      child: const SizedBox(
                        width: 100,
                        child: Center(child: Text("Add to cart")),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    "Reviews(0)",
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Ratings",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Center(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  _tableRow(String? title, String? hint) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "$title",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: 40,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black87, width: 0.5)),
          child: Center(
            child: TextFormField(
              // initialValue: hint,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Row quantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("Quantity")),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("1 - 100")),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("100 - 200")),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("200 - 300")),
          ),
        )
      ],
    );
  }

  Row price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text("Price"),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("234")),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("200")),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("2679")),
          ),
        )
      ],
    );
  }

  Row deliveryTime() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("Delivery\nTime")),
          ),
        ),
        Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("20 days")),
          ),
        ),
        Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("45 days")),
          ),
        ),
        Container(
          width: 80,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Center(child: Text("60 days")),
          ),
        )
      ],
    );
  }

  Row sizeChoice() {
    return Row(
      children: sizeList
          .map((e) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        child: Center(child: Text(e.size!)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        child: Center(child: Text("${e.value}")),
                      ),
                    ),
                  )
                ],
              ))
          .toList(),
    );
  }

  Row colorChoice() {
    return Row(
      children: colorList
          .map((e) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        child: Center(child: Text(e.name!)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          color: e.color,
                          border: Border.all(color: Colors.black, width: 0.5)),
                    ),
                  )
                ],
              ))
          .toList(),
    );
  }

  Row imageList() {
    return Row(
      children: cloothesImages
          .map((e) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      currentImage = e.image!;
                    });
                  },
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      e.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class ImagesClass {
  String? title;
  String? image;
  ImagesClass({this.title, this.image});
}

class SizeClass {
  String? size;
  int? value;
  SizeClass({this.size, this.value});
}

class ColorChoice {
  String? name;
  Color? color;
  ColorChoice({this.name, this.color});
}

class DevileryQuot {
  String? quantity;
  String? price;
  String? delTime;
  DevileryQuot({this.quantity, this.price, this.delTime});
}
