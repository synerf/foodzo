import 'package:foodzo/controllers/popular_food_controller.dart';
import 'package:foodzo/data/api/api_client.dart';
import 'package:foodzo/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../data/repository/popular_food_repo.dart';

Future<void> init() async {
  // for api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // for repos
  Get.lazyPut(() => PopularFoodRepo(apiClient: Get.find()));

  // for controllers
  Get.lazyPut(() => PopularFoodController(popularFoodRepo: Get.find()));
}
