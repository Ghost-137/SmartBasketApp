import 'package:get/get.dart';

class CartController extends GetxController {
  var quantity = 1.obs;
  var totalPrice = 0.0.obs;

  // Initialize total price (convert price to double)
  void initPrice(String price) {
    totalPrice.value = double.parse(price);
  }

  // Increase quantity and update total
  void increaseQuantity(String price) {
    quantity.value++;
    updateTotal(price);
  }

  // Decrease quantity and update total
  void decreaseQuantity(String price) {
    if (quantity.value > 1) {
      quantity.value--;
      updateTotal(price);
    }
  }

  // Update total price based on quantity
  void updateTotal(String price) {
    totalPrice.value = double.parse(price) * quantity.value;
  }
}
