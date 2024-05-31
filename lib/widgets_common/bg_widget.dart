
import 'package:flutter/material.dart';
import 'package:smart_basket_app/consts/images.dart';

Widget bgWidget({Widget? child}) {
  return Container(
      child: child,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(imgBackground), fit: BoxFit.fill),
      ));
}
