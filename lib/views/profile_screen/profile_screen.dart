
import 'package:get/get.dart';

import 'package:smart_basket_app/consts/consts.dart';
import 'package:smart_basket_app/consts/lists.dart';
import 'package:smart_basket_app/controllers/auth_controller.dart';
import 'package:smart_basket_app/views/auth_screen/login_screen.dart';
import 'package:smart_basket_app/views/profile_screen/components/details_card.dart';
import 'package:smart_basket_app/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          //  padding: EdgeInsets.all(8),
          child: Column(
            children: [
              //edit profile button
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                ),
              ).onTap(() {}),

              //users details section
              Row(
                children: [
                  Image.asset(imgProfile2, width: 80, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "customer@example.com".text.white.make(),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor,
                      ),
                    ),
                    onPressed: () async {
                      await Get.put(AuthController()).signupMethod(context);
                      Get.offAll(() => const LoginScreen());
                    },
                    child: logout.text.fontFamily(semibold).white.make(),
                  ),
                ],
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      count: "00",
                      title: "In your cart",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "30",
                      title: "In your wishlist",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "50",
                      title: "your order",
                      width: context.screenWidth / 3.4),
                ],
              ),

              //button section

              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonsList.length,
                itemBuilder: (BuildContext, int index) {
                  return ListTile(
                    leading: Image.asset(profileButtonsIcon[index], width: 22),
                    title: "${profileButtonsList[index]}"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .shadowSm
                  .margin(EdgeInsets.all(12))
                  .padding(EdgeInsets.symmetric(horizontal: 16))
                  .make()
                  .box
                  .color(redColor)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
