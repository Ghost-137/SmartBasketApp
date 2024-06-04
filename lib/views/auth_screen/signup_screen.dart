import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_basket_app/consts/colors.dart';
import 'package:smart_basket_app/consts/firebase_consts.dart';
import 'package:smart_basket_app/consts/strings.dart';
import 'package:smart_basket_app/consts/styles.dart';
import 'package:smart_basket_app/controllers/auth_controller.dart';
import 'package:smart_basket_app/views/home_screen/home.dart';
import 'package:smart_basket_app/widgets_common/custom_textfield.dart';
import 'package:smart_basket_app/widgets_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets_common/applogo_widgets.dart';
import '../../widgets_common/bg_widget.dart';
//import 'package:smart_basket/views/home_screen/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  final AuthController controller = AuthController();

  //text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              5.heightBox,
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              5.heightBox,
              Column(
                children: [
                  customTextfield(
                      hint: nameHint,
                      title: name,
                      controller: nameController,
                      isPass: false),
                  customTextfield(
                      hint: emailHint,
                      title: email,
                      controller: emailController,
                      isPass: false),
                  customTextfield(
                      hint: passwordHint,
                      title: password,
                      controller: passwordController,
                      isPass: true),
                  customTextfield(
                      hint: passwordHint,
                      title: retypePassword,
                      controller: passwordRetypeController,
                      isPass: true),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make())),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                            TextSpan(
                                text: termAndCond,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )),
                            TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                            TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )),
                          ],
                        )),
                      )
                    ],
                  ),
                  5.heightBox,
                  ourButton(
                    color: isCheck == true ? redColor : lightGolden,
                    title: signup,
                    textColor: whiteColor,
                    onPress: () async {
                      if (isCheck != false) {
                        try {
                          await controller
                              .signUpMethodMine(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then(
                            (value) {
                              return controller.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                            },
                          ).then(
                            (value) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => const Home());
                            },
                          );
                        } catch (e) {
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                        }
                      }
                    },
                  ).box.width(context.screenWidth - 50).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
              10.heightBox,
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(
                          fontFamily: bold,
                          color: fontGrey,
                        ),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(
                          fontFamily: bold,
                          color: redColor,
                        ),
                      ),
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
