import 'package:flutter/material.dart';
import 'package:foodzo/controllers/cart_controller.dart';
import 'package:foodzo/data/repository/popular_product_repo.dart';
import 'package:foodzo/models/products_model.dart';
import 'package:foodzo/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  /// function to get list of popular food
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularFoodList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print("increment" + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      print("decrement" + _quantity.toString());
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !", backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item count", "You can't add more !", backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // if exists
    // get from storage _inCartItems = 3
  }

  void addItem(ProductModel product) {
    if (quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        print("The id is " + value.id.toString() + " The quantity is " + value.quantity.toString());
      });
    } else {
      Get.snackbar("Item count", "Please add at least one item", backgroundColor: AppColors.mainColor, colorText: Colors.white);
    }
  }
}
