import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smart_basket_app/consts/consts.dart';
import 'package:smart_basket_app/views/home_screen/home.dart';
import 'package:smart_basket_app/views/home_screen/home_screen.dart';

class CheckOutPage extends StatefulWidget {
  final double total_price;

  CheckOutPage({super.key, required this.total_price});

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "ADDRESS",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView(
                children: [
                  selectedAddressSection(),
                  standardDelivery(),
                  //  checkoutItem(),
                  priceSection(widget.total_price),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {
                    showThankYouBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    "Place Order",
                    style: CustomTextStyle.textFormFieldMedium.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showThankYouBottomSheet(BuildContext context) {
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 2),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  thankYouMY,
                  width: 300,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            "\n\nThank you for your purchase. Our company values each and every customer. If you have any questions, please don’t hesitate to reach out.",
                        style: CustomTextStyle.textFormFieldMedium.copyWith(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Get.off(Home());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        "Track Order",
                        style: CustomTextStyle.textFormFieldMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 2,
    );
  }

  Widget selectedAddressSection() {
    return Card(
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "James Francois (Default)",
                  style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "HOME",
                    style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.indigoAccent.shade200,
                      fontSize: 8,
                    ),
                  ),
                ),
              ],
            ),
            createAddressText("431, Commerce House, Nagindas Master, Fort", 16),
            createAddressText("Mumbai - 400023", 6),
            createAddressText("Maharashtra", 6),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mobile : 02222673745",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 12,
                    color: Colors.grey.shade800,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit / Change",
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          fontSize: 12,
                          color: Colors.indigo.shade700,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add New Address",
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                          fontSize: 12,
                          color: Colors.indigo.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget standardDelivery() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent.withOpacity(0.4),
          width: 1,
        ),
        color: Colors.tealAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (isChecked) {},
            activeColor: Colors.tealAccent.shade400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Standard Delivery",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Get it by 20 Jul - 27 Jul | Free Delivery",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget checkoutItem() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Image.asset(
              "images/details_shoes_image.webp",
              width: 35,
              height: 45,
            ),
            const SizedBox(width: 8),
            Text(
              "Estimated Delivery: 21 Jul 2019",
              style: CustomTextStyle.textFormFieldMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget priceSection(double price) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("PRICE DETAILS", style: CustomTextStyle.textFormFieldBold),
          const Divider(),
          _createPriceRow("Total MRP", "${price}"),
          _createPriceRow("Bag Discount", "20"),
          _createPriceRow("Tax", "96"),
          _createPriceRow("Delivery Charges", "120"),
          _createPriceRow("Order Total", "${price + 196}"),
        ],
      ),
    );
  }

  Widget _createPriceRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: CustomTextStyle.textFormFieldMedium),
        Text(amount, style: CustomTextStyle.textFormFieldBold),
      ],
    );
  }

  Widget createAddressText(String text, double topMargin) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: Text(
        text,
        style: CustomTextStyle.textFormFieldMedium.copyWith(
          fontSize: 12,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}

class CustomTextStyle {
  static var textFormFieldRegular = const TextStyle(
      fontSize: 16,
      fontFamily: "Helvetica",
      color: Colors.black,
      fontWeight: FontWeight.w400);

  static var textFormFieldLight =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w200);

  static var textFormFieldMedium =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w500);

  static var textFormFieldSemiBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w600);

  static var textFormFieldBold =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w700);

  static var textFormFieldBlack =
      textFormFieldRegular.copyWith(fontWeight: FontWeight.w900);
}
