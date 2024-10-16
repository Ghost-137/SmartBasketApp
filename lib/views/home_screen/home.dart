import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_basket_app/consts/colors.dart';
import 'package:smart_basket_app/consts/images.dart';
import 'package:smart_basket_app/consts/strings.dart';
import 'package:smart_basket_app/consts/styles.dart';
import 'package:smart_basket_app/controllers/home_controllers.dart';
import 'package:smart_basket_app/views/cart_screen/cart_screen.dart';
import 'package:smart_basket_app/views/category_screen/category_screen.dart';
import 'package:smart_basket_app/views/home_screen/home_screen.dart';
import 'package:smart_basket_app/views/profile_screen/profile_screen.dart';

// This Page Contains Bottom Navigation Bar.

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeControllers());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];
    var navBody = [
      const HomeScreen(),
      const Categoryscreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (Value) {
            controller.currentNavIndex.value = Value;
          },
        ),
      ),
    );
  }
}
