
import 'package:get/get.dart';
import 'package:smart_basket_app/consts/consts.dart';
import 'package:smart_basket_app/consts/lists.dart';
import 'package:smart_basket_app/controllers/auth_controller.dart';
import 'package:smart_basket_app/views/auth_screen/signup_screen.dart';
import 'package:smart_basket_app/widgets_common/applogo_widgets.dart';
import 'package:smart_basket_app/widgets_common/bg_widget.dart';
import 'package:smart_basket_app/widgets_common/custom_textfield.dart';
import 'package:smart_basket_app/widgets_common/our_button.dart';

import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controlle = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
          10.heightBox,
          Column(
            children: [
              customTextfield(
                hint: emailHint,
                title: email,
                isPass: false,
                controller: controlle.emailController,
              ),
              customTextfield(
                hint: passwordHint,
                title: password,
                isPass: true,
                controller: controlle.passwordController,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetPass.text.make())),
              5.heightBox,
              ourButton(
                  color: redColor,
                  title: login,
                  textColor: whiteColor,
                  onPress: () async {
                    await controlle.loginMethod(context: context).then((value) {
                      if (value != null) {
                        VxToast.show(context, msg: loggedin);
                        Get.offAll(() => const Home());
                      }
                    });
                  }).box.width(context.screenWidth - 50).make(),
              5.heightBox,
              createNewAccount.text.color(fontGrey).make(),
              5.heightBox,
              ourButton(
                  color: lightGolden,
                  title: signup,
                  textColor: redColor,
                  onPress: () {
                    Get.to(() => const SignupScreen());
                  }).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              loginWith.text.color(fontGrey).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(
                              socialIconeList[index],
                              width: 30,
                            ),
                          ),
                        )),
              ),
            ],
          )
              .box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make(),
        ],
      )),
    ));
  }
}
