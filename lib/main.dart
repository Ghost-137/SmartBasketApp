import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_basket_app/consts/colors.dart';
import 'package:smart_basket_app/consts/strings.dart';
import 'package:smart_basket_app/consts/styles.dart';
import 'package:smart_basket_app/controllers/home_controllers.dart';
import 'package:smart_basket_app/views/cart_screen/cart_controller.dart';
import 'package:smart_basket_app/views/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print(
      'Firebase initialized successfully'); // Add this log to check initialization
  Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //her using getx so we have to change this material app into getmaterial app

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            //to set app ber icons color
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            //set elevation to 0
            elevation: 0.0,
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
