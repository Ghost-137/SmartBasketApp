import 'package:flutter/cupertino.dart';
import 'package:smart_basket_app/consts/colors.dart';
import 'package:smart_basket_app/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.fontFamily(bold).size(16).color(darkFontGrey).make(),
      5.heightBox,
      "in your cart".text.color(darkFontGrey).make(),
    ],
  ).box.rounded.width(width).height(70).padding(EdgeInsets.all(3)).white.make();
}
