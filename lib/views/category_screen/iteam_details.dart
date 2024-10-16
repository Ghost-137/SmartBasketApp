import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_basket_app/consts/consts.dart';
import 'package:smart_basket_app/views/cart_screen/cart_controller.dart';
import 'package:smart_basket_app/widgets_common/our_button.dart';

class IteamDetails extends StatefulWidget {
  final Map<String, dynamic> _productm;
  IteamDetails(this._productm, {super.key});

  @override
  State<IteamDetails> createState() => _IteamDetailsState();
}

class _IteamDetailsState extends State<IteamDetails> {
  final CartController _cartController = Get.put(CartController());

  Future AddCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("user-cart-items");

    return collectionReference
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._productm["product-name"],
      "image": widget._productm["product-images"],
      "price": widget._productm["product-price"],
      "quantity": _cartController.quantity.value,
      "total": _cartController.totalPrice.toStringAsFixed(2),
    }).then((value) => Get.snackbar(
            "Added", "Product Added Successfully to cart",
            icon: const Icon(Icons.add_shopping_cart_outlined),
            shouldIconPulse: true,
            barBlur: 20,
            isDismissible: true,
            duration: const Duration(seconds: 3)));
  }

  @override
  void initState() {
    super.initState();
    _cartController.initPrice(widget._productm["product-price"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: Text("${widget._productm["product-name"]}"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 300,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget._productm["product-images"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    Text("${widget._productm["product-name"]}"),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    Text(
                      "\$${widget._productm["product-price"]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        const Text("Quantity:"),
                        IconButton(
                          onPressed: () => _cartController.decreaseQuantity(
                            widget._productm["product-price"],
                          ),
                          icon: const Icon(Icons.remove),
                        ),
                        Obx(() => Text(
                              "${_cartController.quantity.value}",
                              style: const TextStyle(fontSize: 16),
                            )),
                        IconButton(
                          onPressed: () => _cartController.increaseQuantity(
                            widget._productm["product-price"],
                          ),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.widthBox,
                        Obx(() => Text(
                              "${_cartController.totalPrice.value.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                    10.heightBox,
                    Text(
                      "${widget._productm["product-description"]}",
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: () {
                AddCart();
                _cartController.quantity.value = 0;
              },
              textColor: whiteColor,
              title: "Add to Cart",
            ),
          ),
        ],
      ),
    );
  }
}
