import 'package:foodzo/controllers/cart_controller.dart';
import 'package:foodzo/controllers/popular_product_controller.dart';
import 'package:foodzo/data/api/api_client.dart';
import 'package:foodzo/data/repository/cart_repo.dart';
import 'package:foodzo/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  // for api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // for repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // for controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
