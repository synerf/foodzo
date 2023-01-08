import 'package:foodzo/data/repository/popular_food_repo.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  final PopularFoodRepo popularFoodRepo;

  PopularFoodController({required this.popularFoodRepo});

  List<dynamic> _popularFoodList = [];
  List<dynamic> get popularFoodList => _popularFoodList;

  /// function to get list of popular food
  Future<void> getPopularFoodList() async {
    Response response = await popularFoodRepo.getPopularFoodList();
    if (response.statusCode == 200) {
      _popularFoodList = [];
      // _popularFoodList.addAll();
      update();
    } else {}
  }
}
